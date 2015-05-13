package com.springapp.mvc.repository;

import com.springapp.mvc.domain.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserRepository {

    @Autowired
    private SessionFactory session;

    public void addUser(UsersEntity user) {
        session.getCurrentSession().save(user);
    }

    public void editUser(UsersEntity user) {
        session.getCurrentSession().update(user);
    }

    public void deleteUser(int userId) {
        session.getCurrentSession().delete(findUser(userId));
    }

    public UsersEntity findUser(int userId) {
        return (UsersEntity) session.getCurrentSession().get(UsersEntity.class, userId);
    }

    public UsersEntity findUserByName(String username) {
        Criteria criteria = session.getCurrentSession().createCriteria(UsersEntity.class);
        criteria.add(Restrictions.eq("username", username));
        return (UsersEntity) criteria.uniqueResult();
    }

    public List<UsersEntity> getAllUsers() {
        return session.getCurrentSession().createSQLQuery("Select * from Users").addEntity(UsersEntity.class).list();
    }
}
