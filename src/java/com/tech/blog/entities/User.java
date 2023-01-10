package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp datetime;
    private String about;
    private String profile;
    private int id;
    
//    public User(int id, String name, String email, String password, String gender, Timestamp datetime, String about) {
//        this.id = id;
//        this.name = name;
//        this.email = email;
//        this.password = password;
//        this.gender = gender;
//        this.datetime = datetime;
//        this.about = about;
//    }

    public User() {
    }

    public User(String name, String email, String password, String gender, String about,String profile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.profile=profile;
    }

//    getters and setters
//    if object is already create and to update a single property to database

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    
    
}
