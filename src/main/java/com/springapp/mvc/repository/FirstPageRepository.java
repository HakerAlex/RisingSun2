package com.springapp.mvc.repository;

import com.springapp.mvc.domain.ArticlesEntity;
import com.springapp.mvc.domain.FirstpageEntity;
import com.springapp.mvc.domain.TagsEntity;
import com.springapp.mvc.domain.UsersEntity;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

/**
 * Created by Alex on 01.05.2015.
 */
@Repository
@Transactional
public class FirstPageRepository {
    @Autowired
    private SessionFactory sessionFactory;

    public void addFirstPage(int idArticle, boolean feature, int raiting){
        this.sessionFactory.getCurrentSession().createSQLQuery("Insert INTO firstpage (Article_ID,feature,Raiting) values(:id,:fe,:ra)").setInteger("id",idArticle).setBoolean("fe",feature).setInteger("ra",raiting).executeUpdate();
    }

    public List<FirstpageEntity> listAll(){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM firstpage LEFT JOIN articles ON firstpage.Article_ID = articles.ID LEFT JOIN users ON users.ID = articles.Author ORDER BY Raiting desc").addEntity(FirstpageEntity.class).addEntity(ArticlesEntity.class).addEntity(UsersEntity.class).list();
    }

    public List<FirstpageEntity> newsByName(String name){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM firstpage LEFT JOIN articles on firstpage.Article_ID=articles.ID LEFT JOIN users on users.ID = articles.Author WHERE articles.NamePage=:name order by Raiting").addEntity(ArticlesEntity.class).addEntity(UsersEntity.class).setString("name", name).list();
    }

    public List<Date> newsArchive(){
        return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT LAST_DAY(DateCreate) + INTERVAL 1 DAY - INTERVAL 1 MONTH  as DateArchive FROM articles where articles.archive=1 GROUP BY DateArchive").list();
    }

    public void removeArticleFromFirstPage(Integer id){
        this.sessionFactory.getCurrentSession().createSQLQuery("DELETE from firstpage WHERE ID=:id").setInteger("id",id).executeUpdate();
    }


    public void removeArticleFromFirstPageByArticle_ID(Integer id){
        this.sessionFactory.getCurrentSession().createSQLQuery("DELETE from firstpage WHERE Article_ID=:id").setInteger("id",id).executeUpdate();
    }

    public List<TagsEntity> tagsByNewsName(String name){
        return this.sessionFactory.getCurrentSession().createSQLQuery("Select tags.* from tags left join tagsarcticle on tags.ID=tagsarcticle.ID_Teg left join articles on tagsarcticle.ID_Arcticle=articles.ID where articles.NamePage=:name").addEntity(TagsEntity.class).setString("name", name).list();
    }

    public List<ArticlesEntity> getFirstPageArticles()
    {
        return this.sessionFactory.getCurrentSession().createSQLQuery("select * from firstpage LEFT JOIN articles ON articles.ID = firstpage.Article_ID LEFT JOIN users on users.ID = articles.Author").addEntity(FirstpageEntity.class).addEntity(ArticlesEntity.class).addEntity(UsersEntity.class).list();

    }

    public List<ArticlesEntity> getArticlesWithoutOnFirstPage()
    {
        return   this.sessionFactory.getCurrentSession().createSQLQuery("Select * from articles left JOIN users on users.ID = articles.Author where not articles.id in (Select Article_ID from firstpage) and Archive = FALSE").addEntity(ArticlesEntity.class).addEntity(UsersEntity.class).list();
    }

    public FirstpageEntity getRecordById(int id)
    {
        return  (FirstpageEntity)this.sessionFactory.getCurrentSession().createSQLQuery("Select * from firstpage where id=:id").addEntity(FirstpageEntity.class).setInteger("id",id).uniqueResult();
    }

    public void updateFirstPage(FirstpageEntity firstpage){
        this.sessionFactory.getCurrentSession().update(firstpage);
    }
}
