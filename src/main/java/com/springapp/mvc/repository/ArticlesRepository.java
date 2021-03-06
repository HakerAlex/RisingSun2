package com.springapp.mvc.repository;

import com.springapp.mvc.domain.*;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Objects;

/**
 * Created by Alex on 01.05.2015.
 */

@Repository
@Transactional
public class ArticlesRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public List<UsersEntity> listAllAuthors(){
        return this.sessionFactory.getCurrentSession().createSQLQuery("Select * from users").addEntity(UsersEntity.class).list();
    }

    public List<TagsEntity> listTagsByArticle(int id){
        return this.sessionFactory.getCurrentSession().createSQLQuery("Select * from tagsarcticle LEFT JOIN tags on tags.ID = tagsarcticle.ID_Teg where ID_Arcticle=:id").addEntity(TagsEntity.class).setInteger("id",id).list();
    }

    public List<ArticlesEntity> listAll(){
        return this.sessionFactory.getCurrentSession().createSQLQuery("Select articles.*,users.*,IF(firstpage.ID is NULL,0,1) as flag from articles left join users ON articles.Author=users.ID LEFT JOIN firstpage on articles.ID = firstpage.Article_ID").addEntity(ArticlesEntity.class).addEntity(UsersEntity.class).addScalar("flag").list();
    }

    public ArticlesEntity getArticleByID(int id){
        return (ArticlesEntity) this.sessionFactory.getCurrentSession().createSQLQuery("Select * from articles WHERE  articles.ID=:id").addEntity(ArticlesEntity.class).setInteger("id", id).uniqueResult();
    }

    public List<ArticlesEntity> newsSearch(String name){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM articles WHERE articles.Article LIKE :name or articles.Title LIKE :name order by DateCreate").addEntity(ArticlesEntity.class).setString("name", name).list();
    }

    public List<ArticlesEntity> newsSearchByTag(String name){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT articles.* from articles LEFT JOIN tagsarcticle on articles.ID = tagsarcticle.ID_Arcticle LEFT JOIN tags on tags.ID = tagsarcticle.ID_Teg where tags.Name=:name order by DateCreate").addEntity(ArticlesEntity.class).setString("name", name).list();
    }

    public List<ArticlesEntity> newsByAuthorUsername(String name){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT articles.*,users.*,IF(firstpage.ID is NULL,0,1) as flag FROM articles   LEFT JOIN users on users.ID = articles.Author left join firstpage on firstpage.Article_ID=articles.ID WHERE users.username = :name ORDER BY DateCreate").addEntity(ArticlesEntity.class).addEntity(UsersEntity.class).addScalar("flag").setString("name", name).list();
    }


    public List<ArticlesEntity> newsSearchByAuthor(String name){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT articles.* FROM articles   LEFT JOIN users on users.ID = articles.Author WHERE users.Name = :name ORDER BY DateCreate").addEntity(ArticlesEntity.class).setString("name", name).list();
    }

    public TagsEntity maxCountByTag(String name){
        return (TagsEntity) this.sessionFactory.getCurrentSession().createSQLQuery("Select ID,Name from (Select ID_Teg, max(countTeg) as often from (Select ID_Teg, count(countTeg) as countTeg from (SELECT\n" +
                "ID_Teg,\n" +
                "  1 as countTeg\n" +
                "FROM tagsarcticle LEFT JOIN tags on tags.ID = tagsarcticle.ID_Teg\n" +
                "WHERE ID_Arcticle IN (SELECT ID_Arcticle\n" +
                "                      FROM tagsarcticle\n" +
                "                        LEFT JOIN tags ON tags.ID = tagsarcticle.ID_Teg\n" +
                "                      WHERE Name = :name) and tags.Name<>:name) as TableA group by ID_Teg) as TableB) as TableC  LEFT JOIN tags on TableC.ID_Teg=tags.ID").addEntity(TagsEntity.class).setString("name", name).uniqueResult();
    }

    public List<ArticlesEntity> newsArchive(Date dateArchive){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM articles WHERE articles.archive=1 and articles.DateCreate BETWEEN :date1 and LAST_DAY(:date1) order by DateCreate").addEntity(ArticlesEntity.class).setDate("date1", dateArchive).list();
    }

    public List<String> allArchive(){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT YEAR(DateCreate) as year,LAST_DAY(DateCreate) + INTERVAL 1 DAY - INTERVAL 1 MONTH  as DateArchive, MONTHNAME(DateCreate) as month FROM articles where articles.archive=1 GROUP BY year,DateArchive ORDER BY YEAR DESC, DateArchive").list();
    }

    public List<Integer> allYearArchive(){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT YEAR(DateCreate) as year FROM articles where articles.archive=1 GROUP BY year ORDER BY year DESC ").list();
    }


    public void deleteArticle(Integer id){
        ArticlesEntity article=(ArticlesEntity)this.sessionFactory.getCurrentSession().load(ArticlesEntity.class,id);
        if(null!=article){
            this.sessionFactory.getCurrentSession().delete(article);
        }
    }

    public TagsEntity getTagByName(String tagName)
    {
        return (TagsEntity) this.sessionFactory.getCurrentSession().createSQLQuery("Select * from tags where Name=:tag").addEntity(TagsEntity.class).setString("tag", tagName).uniqueResult();
    }

    public void addTagsToArticle(ArticlesEntity article, String[] tags)
    {
        for (String tag:tags)
        {
            TagsEntity ourtag=getTagByName(tag.trim());
            if (ourtag==null) {
                this.sessionFactory.getCurrentSession().createSQLQuery("Insert INTO tags (Name) values (:tag) ").setString("tag", tag).executeUpdate();
                ourtag=getTagByName(tag);
            }

            TagsarcticleEntity tagArt=new TagsarcticleEntity();
            tagArt.setArticlesByIdArcticle(article);
            tagArt.setTagsByIdTeg(ourtag);

            TagsarcticleEntity test = (TagsarcticleEntity) this.sessionFactory.getCurrentSession().createSQLQuery("Select * from tagsarcticle where ID_Arcticle=:idArticle and ID_Teg=:idTag").addEntity(TagsarcticleEntity.class).setInteger("idArticle", article.getId()).setInteger("idTag",ourtag.getId()).uniqueResult();

            if (test==null)
                this.sessionFactory.getCurrentSession().save(tagArt);
        }
    }

    public void deleteAllTagByArticleID(int id){
        this.sessionFactory.getCurrentSession().createSQLQuery("Delete from tagsarcticle where tagsarcticle.ID_Arcticle=:idArticle").setInteger("idArticle",id).executeUpdate();
    }

    public void updateArticle(ArticlesEntity article, String[] tags){
        try {
            this.sessionFactory.getCurrentSession().update(article);
            deleteAllTagByArticleID(article.getId());
            addTagsToArticle(article,tags);
        }catch (Exception e)
        {
        }
    }

    public void addArticle(ArticlesEntity article, String[] tags){
        try {
            this.sessionFactory.getCurrentSession().save(article);
            addTagsToArticle(article,tags);
        }catch (Exception e)
        {
        }
    }
}

