package com.springapp.mvc.controller;

import com.springapp.mvc.domain.ArticlesEntity;
import com.springapp.mvc.domain.TagsEntity;
import com.springapp.mvc.repository.ArticlesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by Alex on 01.05.2015.
 */
@Controller
public class ArticlesController {

    private ArticlesRepository articlesRepository;


    @Autowired
    public ArticlesController(ArticlesRepository articlesRepository){
        this.articlesRepository=articlesRepository;
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

}
