package com.springapp.mvc.controller;

import com.springapp.mvc.domain.ArticlesEntity;
import com.springapp.mvc.domain.TagsEntity;
import com.springapp.mvc.domain.UsersEntity;
import com.springapp.mvc.repository.ArticlesRepository;
import com.springapp.mvc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class ArticlesController {

    private ArticlesRepository articlesRepository;
    private UserRepository userRepository;


    @Autowired
    public ArticlesController(ArticlesRepository articlesRepository, UserRepository userRepository){
        this.articlesRepository=articlesRepository;
        this.userRepository=userRepository;
    }


    private  List<ArticlesEntity> clearSymbols(List<ArticlesEntity> newsList){
        for (Object news:newsList){
            ArticlesEntity article=(ArticlesEntity) news;
            String ourText=org.apache.taglibs.string.util.XmlW.removeXml(article.getArticle());
            int len=Math.min(200, ourText.length() - 1);

            ourText=ourText.substring(0, len);
            len=ourText.lastIndexOf(" ");
            ourText=ourText.substring(0, len);
            article.setArticle(ourText + "...");
        }
        return newsList;
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search(@RequestParam("value") String search1, Model model) {
        List<ArticlesEntity> news = this.articlesRepository.newsSearch("%" + search1 + "%");
        List<Date> list=this.articlesRepository.newsArchive();
        model.addAttribute("allnews", clearSymbols(news));
        model.addAttribute("archive", list);
        model.addAttribute("searchr", " Search by value:"+search1);
        return "search";
    }

    @RequestMapping(value = "archive/{date}", method = RequestMethod.GET)
    public String searchByDate(@PathVariable Date date, Model model) {
        List<ArticlesEntity> news = this.articlesRepository.newsArchive(date);
        List<Date> list=this.articlesRepository.newsArchive();
        model.addAttribute("allnews", clearSymbols(news));
        model.addAttribute("archive", list);
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM-yyyy");
        model.addAttribute("searchr", " Archive from:"+ dateFormat.format(date));
        return "search";
    }

    @RequestMapping(value = "tags/{tag}", method = RequestMethod.GET)
    public String searchByTag(@PathVariable String tag,  Model model) {
        List<ArticlesEntity> news = this.articlesRepository.newsSearchByTag(tag);
        List<Date> list=this.articlesRepository.newsArchive();
        TagsEntity tagE=this.articlesRepository.maxCountByTag(tag);
        model.addAttribute("allnews", clearSymbols(news));
        model.addAttribute("archive", list);
        model.addAttribute("searchr", " Search by tag:<a href=\"/tags/"+tag+"\">"+tag+"</a>, this tag often to meet with <a href=\"/tags/"+tagE.getName()+"\">"+tagE.getName()+"</a>");
        return "search";
    }

    @RequestMapping(value = "author/{author}", method = RequestMethod.GET)
    public String searchByAuthor(@PathVariable String author,  Model model) {
        List<ArticlesEntity> news = this.articlesRepository.newsSearchByAuthor(author);
        List<Date> list=this.articlesRepository.newsArchive();
        model.addAttribute("allnews", clearSymbols(news));
        model.addAttribute("archive", list);
        model.addAttribute("searchr", " Search by author:<a href=\"/author/"+author+"\">"+author+"</a>");
        return "search";
    }

    @RequestMapping(value = "tablearticles", method = RequestMethod.GET)
    public String tablearticles(Model model) {
        List<ArticlesEntity> articles = this.articlesRepository.listAll();
        model.addAttribute("articles", articles);
        return "tablearticles";
    }

    @RequestMapping(value = "editarticle/{id}", method = RequestMethod.GET)
    public String editarticles(@PathVariable int id,Model model) {
        ArticlesEntity article = this.articlesRepository.getArticleByID(id);
        List<UsersEntity> users=this.articlesRepository.listAllAuthors();
        List<TagsEntity> tags=this.articlesRepository.listTagsByArticle(id);
        model.addAttribute("arcticle", article);
        model.addAttribute("authors", users);
        model.addAttribute("tags", tags);
        return "editarticles";
    }

    @RequestMapping(value = "updatearticle", method = RequestMethod.POST)
    public String updatearticles(@RequestParam("article") String textarticle,@RequestParam("tags[]") String[] tags,@RequestParam("dateCreate") Timestamp datecreate, @RequestParam("author") int author, @RequestParam("id") int id,@RequestParam("title") String title, @RequestParam("namepage") String namepage, @RequestParam(value="image", defaultValue = "",required = false) String image, @RequestParam(value="archive" , required = false, defaultValue = "off") String status, Model model) {
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
        article.setUsersByAuthor(this.userRepository.findUser(author));
        article.setDateCreate(datecreate);
        article.setArticle(textarticle);

        this.articlesRepository.updateArticle(article,tags);

        return "redirect:/tablearticles";
    }


}
