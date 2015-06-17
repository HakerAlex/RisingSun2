package com.springapp.mvc.controller;

import com.springapp.mvc.domain.ArticlesEntity;
import com.springapp.mvc.domain.TagsEntity;
import com.springapp.mvc.domain.UsersEntity;
import com.springapp.mvc.repository.ArticlesRepository;
import com.springapp.mvc.repository.FirstPageRepository;
import com.springapp.mvc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class ArticlesController {

    private ArticlesRepository articlesRepository;
    private UserRepository userRepository;
    private FirstPageRepository firstPageRepository;


    @Autowired
    public ArticlesController(ArticlesRepository articlesRepository, UserRepository userRepository, FirstPageRepository firstPageRepository){
        this.articlesRepository=articlesRepository;
        this.userRepository=userRepository;
        this.firstPageRepository=firstPageRepository;
    }


    public String stripTags(String xmlStr){
        xmlStr = xmlStr.replaceAll("<(.)+?>", "");
        xmlStr = xmlStr.replaceAll("<(\n)+?>", "");
        return xmlStr;
    }

    private  List<ArticlesEntity> clearSymbols(List<ArticlesEntity> newsList){
        for (Object news:newsList){
            ArticlesEntity article=(ArticlesEntity) news;
            String ourText=stripTags(article.getArticle());
            int len=Math.min(200, ourText.length() - 1);

            ourText=ourText.substring(0, len);
            len=ourText.lastIndexOf(" ");
            ourText=ourText.substring(0, len);
            article.setArticle(ourText + "...");
        }
        return newsList;
    }

    private  List<ArticlesEntity> clearSymbolsForSearch(List<ArticlesEntity> newsList, String search){
        List<Object> newsWrong=new ArrayList<>();
        List<Object> newsTitle=new ArrayList<>();
        //create pattern
        String pat="";
        for (char i:search.toCharArray()){
            pat=pat+"("+Character.toLowerCase(i)+"|"+Character.toUpperCase(i)+")";
        }
        String ourText;
        for (Object news:newsList) {
            ArticlesEntity article = (ArticlesEntity) news;
            for (int i = 1; i <= 2; i++)
            {
                if (i==1)
                    ourText = stripTags(article.getArticle());
                else
                    ourText = article.getTitle();


                int position = ourText.toLowerCase().indexOf(search.toLowerCase());

                if (i==1) {
                    if (position != -1) {

                        int positionComa = ourText.lastIndexOf(".", position);
                        int positionA = ourText.lastIndexOf("?", position);
                        int positionE = ourText.lastIndexOf("!", position);

                        positionComa=Math.max(positionComa,positionA);
                        positionComa=Math.max(positionComa,positionE);


                        int positionComaL = ourText.indexOf(".", position);
                        int positionAL = ourText.indexOf("?", position);
                        int positionEL = ourText.indexOf("!", position);

                        if (positionComaL==-1) positionComaL=1000000;
                        if (positionAL==-1) positionAL=1000000;
                        if (positionEL==-1) positionEL=1000000;

                        positionComaL=Math.min(positionComaL, positionAL);
                        positionComaL = Math.min(positionComaL,positionEL);


                        if (positionComaL==1000000) positionComaL=ourText.length()-1;

                        if (positionComaL-positionComa<200)
                            positionComaL=positionComaL+200-(positionComaL-positionComa)+100;
                        else
                            positionComaL=positionComaL+100;

                        positionComaL=Math.min(positionComaL,ourText.length()-1);

                        if (positionComa == -1) //this begin text
                            ourText = ourText.substring(0, positionComaL);
                        else
                            ourText = ourText.substring(positionComa + 1, positionComaL);

                       positionComa = ourText.lastIndexOf(".");
                       positionA = ourText.lastIndexOf("?");
                       positionE = ourText.lastIndexOf("!");

                        positionComa=Math.max(positionComa,positionA);
                        positionComa=Math.max(positionComa, positionE);

                        if (positionComa>0)
                        ourText = ourText.substring(0, positionComa);

                    } else {
                        newsWrong.add(news);
                    }



                }
                else{
                    if (position != -1){
                        newsTitle.add(news);
                    }
                }

                StringBuffer sb = new StringBuffer();
                Matcher m = Pattern.compile(pat).matcher(ourText);
                while (m.find()) {
                    m.appendReplacement(sb, "<span style=\" background: yellow\">" + m.group() + "</span>");
                }
                m.appendTail(sb);
                if (i==1)
                    article.setArticle(sb.toString() + "...");
                else
                    article.setTitle(sb.toString());
            }
        }
        if (!newsTitle.isEmpty()) newsWrong.removeAll(newsTitle);
        if (!newsWrong.isEmpty()) newsList.removeAll(newsWrong);
        return newsList;
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search(@RequestParam("value") String search1, Model model) {
        if (search1.trim()=="") return "redirect:/";
        List<ArticlesEntity> news = this.articlesRepository.newsSearch("%" + search1 + "%");
        model.addAttribute("allnews", clearSymbolsForSearch(news,search1));
        model.addAttribute("searchr", " Search by value:"+search1);
        return "search";
    }

    @RequestMapping(value = "archive/{date}", method = RequestMethod.GET)
    public String searchByDate(@PathVariable Date date, Model model) {
        List<ArticlesEntity> news = this.articlesRepository.newsArchive(date);
        model.addAttribute("allnews", clearSymbols(news));
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM-yyyy");
        model.addAttribute("searchr", " Archive from:"+ dateFormat.format(date));
        return "search";
    }


    @RequestMapping(value = "allarchive", method = RequestMethod.GET)
    public String archiveAll(Model model) {
        List<String> list=this.articlesRepository.allArchive();
        List<Integer> listYear=this.articlesRepository.allYearArchive();
        model.addAttribute("allnews", list);
        model.addAttribute("yearnews", listYear);
        return "archive";
    }



    @RequestMapping(value = "tags/{tag}", method = RequestMethod.GET)
    public String searchByTag(@PathVariable String tag,  Model model) {
        List<ArticlesEntity> news = this.articlesRepository.newsSearchByTag(tag);
        TagsEntity tagE=this.articlesRepository.maxCountByTag(tag);
        if (tagE==null) {
            tagE=new TagsEntity();
            tagE.setName("");
        }
        model.addAttribute("allnews", clearSymbols(news));
        model.addAttribute("searchr", " Search by tag:<a href=\"../tags/"+tag+"\">"+tag+"</a>, this tag often to meet with <a href=\"../tags/"+tagE.getName()+"\">"+tagE.getName()+"</a>");
        return "search";
    }

    @RequestMapping(value = "author/{author}", method = RequestMethod.GET)
    public String searchByAuthor(@PathVariable String author,  Model model) {
        List<ArticlesEntity> news = this.articlesRepository.newsSearchByAuthor(author);
        model.addAttribute("allnews", clearSymbols(news));
        model.addAttribute("searchr", " Search by author:<a href=\"../author/"+author+"\">"+author+"</a>");
        return "search";
    }


    public int onlyAuthor(){
        int onlyAut=0;
        for (GrantedAuthority authority : SecurityContextHolder.getContext().getAuthentication().getAuthorities()) {
            if(authority.getAuthority().equals("Author"))
                onlyAut=1;
            else
                onlyAut=0;
        }
        return onlyAut;
    }

    public User getCurrentUser(){
        return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }


    @PreAuthorize("hasRole('Admin') or hasRole('Editor') or hasRole('Author') or hasRole('Corrector')")
    @RequestMapping(value = "tablearticles", method = RequestMethod.GET)
    public String tablearticles(Model model) {

        List<ArticlesEntity> articles;

        if (onlyAuthor()==1){
            User user=getCurrentUser();
            articles= this.articlesRepository. newsByAuthorUsername(user.getUsername());
        }
        else
            articles = this.articlesRepository.listAll();


        model.addAttribute("articles", articles);
        return "tablearticles";
    }

    @PreAuthorize("hasRole('Admin') or hasRole('Editor') or hasRole('Author') or hasRole('Corrector')")
    @RequestMapping(value = "editarticle/{id}", method = RequestMethod.GET)
    public String editarticles(@PathVariable int id,Model model) {

        ArticlesEntity article = this.articlesRepository.getArticleByID(id);

        if (onlyAuthor()==1) {
            User user=getCurrentUser();
            if (!user.getUsername().toLowerCase().equals(article.getUsersByAuthor().getUsername().toLowerCase()))return "forward:/tablearticles";
        }

        List<UsersEntity> users=this.articlesRepository.listAllAuthors();
        List<TagsEntity> tags=this.articlesRepository.listTagsByArticle(id);
        model.addAttribute("arcticle", article);
        model.addAttribute("authors", users);
        model.addAttribute("tags", tags);



        return "editarticles";
    }

    @PreAuthorize("hasRole('Admin') or hasRole('Editor') or hasRole('Author') or hasRole('Corrector')")
    @RequestMapping(value = "updatearticle", method = RequestMethod.POST)
    public String updatearticles(@RequestParam("article") String textarticle,@RequestParam(value="tags[]", defaultValue = "",required = false) String[] tags,@RequestParam("dateCreate") Timestamp datecreate, @RequestParam("author") String author, @RequestParam("id") int id,@RequestParam("title") String title, @RequestParam("namepage") String namepage, @RequestParam(value="image", defaultValue = "",required = false) String image, @RequestParam(value="archive" , required = false, defaultValue = "off") String status, Model model) {
        ArticlesEntity article=new ArticlesEntity();
        article.setId(id);
        article.setTitle(title);
        article.setNamePage(namepage);
        article.setImage(image);

        boolean ourA;
        if (status.equals("on"))
            ourA=true;
        else
            ourA=false;

        article.setArchive(ourA);
        article.setUsersByAuthor(this.userRepository.findUserByFullName(author));
        article.setDateCreate(datecreate);
        article.setArticle(textarticle);

        this.articlesRepository.updateArticle(article,tags);

        if (ourA) this.firstPageRepository.removeArticleFromFirstPageByArticle_ID(id);

        return "redirect:/tablearticles";
    }


    @PreAuthorize("hasRole('Admin') or hasRole('Editor') or hasRole('Author')")
    @RequestMapping(value = "addarticles", method = RequestMethod.GET)
    public String editarticles(Model model) {
        List<UsersEntity> users;
        UsersEntity user = this.userRepository.findUserByName(getCurrentUser().getUsername());

        if (onlyAuthor()==1) {
            users=new ArrayList<>();
            users.add(user);
        }
            else
            users=this.articlesRepository.listAllAuthors();

        model.addAttribute("authors", users);
        model.addAttribute("user", user);
        return "addarticles";
    }

    private String getNamePage(){
       java.util.Date ourDate=java.util.Calendar.getInstance().getTime();
       SimpleDateFormat dateFormat = new SimpleDateFormat("yy_MM_dd_HH_mm_ss_Z");
       return "article_"+dateFormat.format(ourDate).replaceAll("\\+","");
    }

    @PreAuthorize("hasRole('Admin') or hasRole('Editor') or hasRole('Author')")
    @RequestMapping(value = "addarticletoDB", method = RequestMethod.POST)
    public String addarticles(@RequestParam("article") String textarticle,@RequestParam(value="tags[]", defaultValue = "",required = false) String[] tags, @RequestParam("author") String author,@RequestParam("title") String title,  @RequestParam(value="image", defaultValue = "",required = false) String image, @RequestParam(value="archive" , required = false, defaultValue = "off") String status, Model model) {
        ArticlesEntity article=new ArticlesEntity();
        article.setTitle(title);
        article.setNamePage(getNamePage());
        article.setImage(image);

        boolean ourA;
        if (status.equals("on"))
            ourA=true;
        else
            ourA=false;

        article.setArchive(ourA);
        article.setUsersByAuthor(this.userRepository.findUserByFullName(author));
        article.setArticle(textarticle);

        this.articlesRepository.addArticle(article, tags);

        return "redirect:/tablearticles";
    }


    @PreAuthorize("hasRole('Admin') or hasRole('Editor')")
    @RequestMapping(value = "deletearticle/{id}", method = RequestMethod.GET)
    public String deletearticles(@PathVariable int id,Model model) {
        this.firstPageRepository.removeArticleFromFirstPage(id);
        this.articlesRepository.deleteAllTagByArticleID(id);
        this.articlesRepository.deleteArticle(id);
        return "redirect:/tablearticles";
    }


}
