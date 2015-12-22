package com.springapp.mvc.repository;

import com.springapp.mvc.domain.*;
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

    public List<DepartmentEntity> getAllDepartment() {

        return session.getCurrentSession().createSQLQuery("Select * from department").addEntity(DepartmentEntity.class).list();
    }

    public List<PositionsEntity> getAllPositions() {

        return session.getCurrentSession().createSQLQuery("Select * from positions").addEntity(PositionsEntity.class).list();
    }

    public PositionsEntity getUserPosition(int id) {

        return (PositionsEntity) session.getCurrentSession().createSQLQuery("Select positions.ID,positions.NameP from positions LEFT JOIN users on users.id_position=positions.ID where users.ID=:ID").addEntity(PositionsEntity.class).setInteger("ID",id).uniqueResult();
    }

    public DepartmentEntity getUserDepartment(int id) {

        return (DepartmentEntity) session.getCurrentSession().createSQLQuery("Select department.ID,department.NameD from department LEFT JOIN users on users.id_department=department.ID where users.ID=:ID").addEntity(DepartmentEntity.class).setInteger("ID",id).uniqueResult();
    }

    public List<UsersEntity> getAllUsers() {
        return session.getCurrentSession().createSQLQuery("Select users.ID as ID, users.Name,password, username,status,email,GROUP_CONCAT(DISTINCT namerule ORDER BY namerule ASC SEPARATOR ', ') AS namerule,\n" +
                "  positions.nameP, department.nameD,organization.nameO\n" +
                "from users\n" +
                "  LEFT JOIN usersrules ON users.ID = usersrules.ID_Users\n" +
                "  LEFT JOIN rules ON rules.ID = usersrules.ID_Rules\n" +
                "  LEFT JOIN positions ON positions.ID = users.id_position\n" +
                "  LEFT JOIN department ON department.ID = users.id_department\n" +
                "  LEFT JOIN organization ON department.id_organization = organization.ID\n" +
                "group by users.Name,email, username,Status, users.ID,positions.nameP, department.nameD,organization.nameO").addEntity(UsersEntity.class).addEntity(RulesEntity.class).addEntity(OrganizationEntity.class).addEntity(DepartmentEntity.class).addEntity(PositionsEntity.class).list();
    }

    public void updateRules(int id,String[] rules)
    {
            session.getCurrentSession().createSQLQuery("Delete from usersrules where ID_Users=:id").setInteger("id", id).executeUpdate();
            for (String rule : rules) {
                session.getCurrentSession().createSQLQuery("Insert into usersrules (ID_Users, ID_Rules) VALUES (:idusers,:idrules)").setInteger("idusers", id).setInteger("idrules", Integer.parseInt(rule.trim())).executeUpdate();
            }
    }

}

