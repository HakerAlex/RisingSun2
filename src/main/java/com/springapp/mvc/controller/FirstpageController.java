package com.springapp.mvc.controller;

import com.springapp.mvc.domain.*;
import com.springapp.mvc.repository.FirstPageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.*;

@Controller
public class FirstpageController {

    private FirstPageRepository firstPageRepository;

    @Autowired
    public FirstpageController(FirstPageRepository firstPageRepository){
        this.firstPageRepository=firstPageRepository;
    }

    public String stripTags(String xmlStr){
        xmlStr = xmlStr.replaceAll("<(.)+?>", "");
        xmlStr = xmlStr.replaceAll("<(\n)+?>", "");
        return xmlStr;
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getNews(Model model) {
        List<FirstpageEntity> news = this.firstPageRepository.listAll();

        for (Object list:news){
            Object[] objectory = (Object[]) list;
            ArticlesEntity article=(ArticlesEntity) objectory[1];
            String ourText=stripTags(article.getArticle());
            int len=Math.min(200, ourText.length() - 1);
            article.setArticle(ourText.substring(0, len));
            ourText= ourText.substring(0, len);
            len=ourText.lastIndexOf(" ");
            ourText=ourText.substring(0, len);
            article.setArticle(ourText + "...");

        }

        List<Date> list=this.firstPageRepository.newsArchive();

        model.addAttribute("allnews", news);
        model.addAttribute("archive", list);
        return "index";
    }

    @RequestMapping(value = "/news/{name}", method = RequestMethod.GET)
    public String getNewsByName(@PathVariable String name, Model model) {
        List<FirstpageEntity> news = this.firstPageRepository.newsByName(name);
        List<Date> list=this.firstPageRepository.newsArchive();
        List<TagsEntity> tags=this.firstPageRepository.tagsByNewsName(name);
        model.addAttribute("allnews", news);
        model.addAttribute("archive", list);
        model.addAttribute("tags", tags);
        return "news";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {

        return "admin";
    }

    @RequestMapping(value = "/admin/{error}", method = RequestMethod.GET)
    public String admin(@PathVariable String error , Model model) {

        if (error.equals("error")) {
            model.addAttribute("error", 1);
        }

        return "admin";
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(Model model) {
        return "dashboard";
    }


    @RequestMapping(value = "/tablefirstpage", method = RequestMethod.GET)
    public String tablefirstpage(Model model) {
        model.addAttribute("firstpages",this.firstPageRepository.getFirstPageArticles());
        model.addAttribute("articles",this.firstPageRepository.getArticlesWithoutOnFirstPage());
        return "tablefirstpage";
    }


    @RequestMapping(value = "/deletefirstpage/{id}", method = RequestMethod.GET)
    public String deleteFromFirstpage(@PathVariable int id, Model model) {
        this.firstPageRepository.removeArticleFromFirstPage(id);
        return "redirect:/tablefirstpage";
    }

    @PreAuthorize("hasRole('Admin') or hasRole('Editor')")
    @RequestMapping(value = "/addtofirstpage", method = RequestMethod.POST)
    public String addtofirstpage(@RequestParam("id") int id, @RequestParam(value="feature" , required = false, defaultValue = "") String feature,@RequestParam(value="raiting" , required = false, defaultValue = "50") int raiting, Model model) {

        boolean feat;
        if (feature.equals("on")) feat=true;
        else feat=false;

        this.firstPageRepository.addFirstPage(id,feat,raiting);

        return "redirect:/tablefirstpage";
    }


    @PreAuthorize("hasRole('Admin') or hasRole('Editor')")
    @RequestMapping(value = "/editfirstpage/{id}", method = RequestMethod.GET)
    public String edittofirstpage(@PathVariable int id, Model model) {

        model.addAttribute("firstpage",this.firstPageRepository.getRecordById(id));

        return "editfirstpage";
    }

    @PreAuthorize("hasRole('Admin') or hasRole('Editor')")
    @RequestMapping(value = "/updatefirstpage", method = RequestMethod.POST)
    public String updatefirstpage(@RequestParam("id") int id, @RequestParam(value="feature" , required = false, defaultValue = "") String feature,@RequestParam(value="raiting" , required = false, defaultValue = "50") int raiting, Model model) {



        FirstpageEntity firstpage=this.firstPageRepository.getRecordById(id);

        boolean feat;
        if (feature.equals("on")) feat=true;
        else feat=false;

        firstpage.setFeature(feat);
        firstpage.setRaiting(raiting);
        this.firstPageRepository.updateFirstPage(firstpage);

        return "redirect:/tablefirstpage";
    }
}
