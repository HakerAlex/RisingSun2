package com.springapp.mvc.domain;

import javax.persistence.*;
import java.util.Collection;
@Entity
@Table(name = "organization")
public class OrganizationEntity {
    private int id;
    private String name;
    private Collection<DepartmentEntity> departmentById;

    @Id
    @Column(name = "ID",  insertable = true, updatable = true)
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Name", nullable = false, insertable = true, updatable = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

//    @OneToMany(mappedBy = "usersByIdUsers")
//    public Collection<DepartmentEntity> getDepartmentById() {
//        return departmentById;
//    }
//
//    public void setDepartmentById(Collection<DepartmentEntity> departmentById) {
//        this.departmentById = departmentById;
//    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrganizationEntity that = (OrganizationEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
