package com.springapp.mvc.repository;

import com.springapp.mvc.domain.RulesEntity;
import com.springapp.mvc.domain.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
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

    public UsersEntity findUser(int userId) {
        return (UsersEntity) session.getCurrentSession().get(UsersEntity.class, userId);
    }

    public List<RulesEntity> findRulesByUserID(int userId) {

        return session.getCurrentSession().createSQLQuery("Select rules.ID, namerule  from users LEFT JOIN usersrules on users.ID = usersrules.ID_Users LEFT JOIN rules ON rules.ID = usersrules.ID_Rules WHERE ID_Users=:ID").addEntity(RulesEntity.class).setInteger("ID",userId).list();
    }

    public List<RulesEntity> findAllRulesByUserID(int userId) {

        return session.getCurrentSession().createSQLQuery("Select * from rules WHERE not rules.ID in (Select rules.ID from users LEFT JOIN usersrules on users.ID = usersrules.ID_Users LEFT JOIN rules ON rules.ID = usersrules.ID_Rules WHERE ID_Users=:ID)").addEntity(RulesEntity.class).setInteger("ID",userId).list();
    }

    public List<RulesEntity> allRules() {

        return session.getCurrentSession().createSQLQuery("Select * from rules").addEntity(RulesEntity.class).list();
    }


    public UsersEntity findUserByName(String username) {
        return (UsersEntity) session.getCurrentSession().createSQLQuery("Select * from users WHERE  users.username=:name").addEntity(UsersEntity.class).setString("name", username).uniqueResult();
    }

    public UsersEntity findUserByFullName(String username) {
        return (UsersEntity) session.getCurrentSession().createSQLQuery("Select * from users WHERE  users.Name=:name").addEntity(UsersEntity.class).setString("name", username).uniqueResult();
    }

    public List<UsersEntity> getAllUsers() {
        return session.getCurrentSession().createSQLQuery("Select users.ID as ID, Name,password, username,status,GROUP_CONCAT(DISTINCT namerule ORDER BY namerule ASC SEPARATOR ', ') AS namerule  from users LEFT JOIN usersrules ON users.ID = usersrules.ID_Users LEFT JOIN rules ON rules.ID = usersrules.ID_Rules group by Name, username,Status, users.ID").addEntity(UsersEntity.class).addEntity(RulesEntity.class).list();
    }

    public void updateRules(int id,String[] rules)
    {
            session.getCurrentSession().createSQLQuery("Delete from usersrules where ID_Users=:id").setInteger("id", id).executeUpdate();
            for (String rule : rules) {
                session.getCurrentSession().createSQLQuery("Insert into usersrules (ID_Users, ID_Rules) VALUES (:idusers,:idrules)").setInteger("idusers", id).setInteger("idrules", Integer.parseInt(rule.trim())).executeUpdate();
            }
    }

}

