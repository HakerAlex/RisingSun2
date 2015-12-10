package com.springapp.mvc.domain;

import javax.persistence.*;
import java.util.Collection;


@Entity
@Table(name = "positions")
public class PositionsEntity {
    private String name;
    private int id;
    private Collection<UsersEntity> usersById;

//
//   @OneToMany(mappedBy = "usersByIdUsers")
//    public Collection<UsersEntity> getUsersById() {
//        return usersById;
//    }
//
//    public void setUsersById(Collection<UsersEntity> usersById) {
//        this.usersById = usersById;
//    }


    @Basic
    @Column(name = "Name", nullable = false, insertable = true, updatable = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    @Id
    @Column(name = "ID",  insertable = true, updatable = true)
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PositionsEntity that = (PositionsEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + id;
        return result;
    }
}
