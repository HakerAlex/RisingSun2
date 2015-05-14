package com.springapp.mvc.controller;

import com.springapp.mvc.domain.*;
import com.springapp.mvc.repository.FirstPageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.*;


/**
 * Created by Alex on 01.05.2015.
 */
@Controller
public class FirstpageController {

    private FirstPageRepository firstPageRepository;


    @Autowired
    public FirstpageController(FirstPageRepository firstPageRepository){
        this.firstPageRepository=firstPageRepository;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getNews(Model model) {
        List<FirstpageEntity> news = this.firstPageRepository.listAll();

        for (Object list:news){
            Object[] objectory=(Object[]) list;
            ArticlesEntity article=(ArticlesEntity) objectory[1];
            String ourText=org.apache.taglibs.string.util.XmlW.removeXml(article.getArticle());
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

    @RequestMapping(value = "news/{name}", method = RequestMethod.GET)
    public String getNewsByName(@PathVariable String name, Model model) {
        List<FirstpageEntity> news = this.firstPageRepository.newsByName(name);
        List<Date> list=this.firstPageRepository.newsArchive();
        List<TagsEntity> tags=this.firstPageRepository.tagsByNewsName(name);
        model.addAttribute("allnews", news);
        model.addAttribute("archive", list);
        model.addAttribute("tags", tags);
        return "news";
    }

    @ModelAttribute("search")
    public Search search() {
        return new Search();
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
}
