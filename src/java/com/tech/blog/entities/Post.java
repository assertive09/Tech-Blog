package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
    private int pid;
    private String pTitle;
    private String pCode;
    private String pContent;
    private String pPic;
    private Timestamp pDate;
    private int catId;

    public Post() {
    }

    public Post(String pTitle, String pCode, String pContent, String pPic, Timestamp pDate, int catId) {
        this.pTitle = pTitle;
        this.pCode = pCode;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }

    public Post(int pid, String pTitle, String pCode, String pContent, String pPic, Timestamp pDate, int catId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pCode = pCode;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
    
    
}
