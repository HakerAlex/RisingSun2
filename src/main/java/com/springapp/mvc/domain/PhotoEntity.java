package com.springapp.mvc.domain;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "photo")
public class PhotoEntity {
    private int id;
    private String firststring;
    private String secondstring;
    private String firstpath;
    private String secondpath;
    private String title;

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
    @Column(name = "Firststring", nullable = false, insertable = true, updatable = true)
    public String getFirststring() {
        return firststring;
    }

    public void setFirststring(String firststring) {
        this.firststring = firststring;
    }

    @Basic
    @Column(name = "Secondstring", nullable = false, insertable = true, updatable = true)
    public String getSecondstring() {
        return secondstring;
    }

    public void setSecondstring(String secondstring) {
        this.secondstring = secondstring;
    }


    @Basic
    @Column(name = "Firstpath", nullable = false, insertable = true, updatable = true)
    public String getFirstpath() {
        return firstpath;
    }

    public void setFirstpath(String firstpath) {
        this.firstpath = firstpath;
    }


    @Basic
    @Column(name = "secondpath", nullable = false, insertable = true, updatable = true)
    public String getSecondpath() {
        return secondpath;
    }

    public void setSecondpath(String secondpath) {
        this.secondpath = secondpath;
    }

    @Basic
    @Column(name = "title", nullable = false, insertable = true, updatable = true)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PhotoEntity that = (PhotoEntity) o;

        if (id != that.id) return false;
        if (firststring != null ? !firststring.equals(that.firststring) : that.firststring != null) return false;
        if (secondstring != null ? !secondstring.equals(that.secondstring) : that.secondstring != null) return false;
        if (firstpath != null ? !firstpath.equals(that.firstpath) : that.firstpath != null) return false;
        if (secondpath != null ? !secondpath.equals(that.secondpath) : that.secondpath != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (firststring != null ? firststring.hashCode() : 0);
        return result;
    }



}
