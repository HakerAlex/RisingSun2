package com.springapp.mvc.domain;

import javax.persistence.*;
import java.util.Collection;


@Entity
@Table(name = "users")
public class UsersEntity {
    private int id;
    private String name;
    private String username;
    private String password;
    private String status;
    private DepartmentEntity departmentByUser;
    private PositionsEntity positionByUser;
    private UsersEntity bossByUser;
    private Collection<ArticlesEntity> articlesById;
    private Collection<UsersrulesEntity> usersrulesById;


    @Id
    @Column(name = "ID", nullable = false, insertable = true, updatable = true)
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Name", nullable = false, insertable = true, updatable = true, length = 100)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "username", nullable = false, insertable = true, updatable = true, length = 50)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    @Basic
    @Column(name = "password", nullable = false, insertable = true, updatable = true, length = 50)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @Basic
    @Column(name = "status", nullable = false, insertable = true, updatable = true, length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UsersEntity that = (UsersEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (username != null ? !username.equals(that.username) : that.username != null) return false;

        return true;
    }



    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "usersByAuthor")
    public Collection<ArticlesEntity> getArticlesById() {
        return articlesById;
    }

    public void setArticlesById(Collection<ArticlesEntity> articlesById) {
        this.articlesById = articlesById;
    }


    @OneToMany(mappedBy = "usersByIdUsers")
    public Collection<UsersrulesEntity> getUsersrulesById() {
        return usersrulesById;
    }

    public void setUsersrulesById(Collection<UsersrulesEntity> usersrulesById) {
        this.usersrulesById = usersrulesById;
    }

    @ManyToOne
    @JoinColumn(name = "id_boss", referencedColumnName = "ID", nullable = false)
    public UsersEntity getBossByUser() {
        return bossByUser;
    }

    public void setBossByUser(UsersEntity bossByUser) {
        this.bossByUser = bossByUser;
    }



}
