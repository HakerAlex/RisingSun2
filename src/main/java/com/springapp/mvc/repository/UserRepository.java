package com.springapp.mvc.repository;

import com.springapp.mvc.domain.RulesEntity;
import com.springapp.mvc.domain.UsersEntity;
import com.springapp.mvc.domain.UsersrulesEntity;
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

    public List<RulesEntity> findRulesByUserID(int userId) {

        return session.getCurrentSession().createSQLQuery("Select rules.ID, NameRule  from users LEFT JOIN usersrules on users.ID = usersrules.ID_Users LEFT JOIN rules ON rules.ID = usersrules.ID_Rules WHERE ID_Users=:ID").addEntity(RulesEntity.class).setInteger("ID",userId).list();
    }

    public List<RulesEntity> findAllRulesByUserID(int userId) {

        return session.getCurrentSession().createSQLQuery("Select * from rules WHERE not rules.ID in (Select rules.ID from users LEFT JOIN usersrules on users.ID = usersrules.ID_Users LEFT JOIN rules ON rules.ID = usersrules.ID_Rules WHERE ID_Users=:ID)").addEntity(RulesEntity.class).setInteger("ID",userId).list();
    }



    public UsersEntity findUserByName(String username) {
        Criteria criteria = session.getCurrentSession().createCriteria(UsersEntity.class);
        criteria.add(Restrictions.eq("username", username));
        return (UsersEntity) criteria.uniqueResult();
    }

    public List<UsersEntity> getAllUsers() {
        return session.getCurrentSession().createSQLQuery("Select Users.ID as ID, Name,password, username,Status,GROUP_CONCAT(DISTINCT NameRule ORDER BY NameRule ASC SEPARATOR ', ') AS NameRule  from Users LEFT JOIN usersrules ON users.ID = usersrules.ID_Users LEFT JOIN rules ON rules.ID = usersrules.ID_Rules group by Name, username,Status, users.ID").addEntity(UsersEntity.class).addEntity(RulesEntity.class).list();
    }
}
