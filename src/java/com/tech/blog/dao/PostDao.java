package com.tech.blog.dao;

import com.mysql.cj.jdbc.PreparedStatementWrapper;
import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PostDao {
     Connection c;

     public PostDao(Connection c) {
        this.c = c;
    }
    
    
    public ArrayList<Categories> getAllCategories(){
    ArrayList<Categories> list=new ArrayList<>();
        try {
            Statement s=this.c.createStatement();
            ResultSet rs=s.executeQuery("select * from categories");
            while(rs.next()){
            int cid=rs.getInt("cid");
            String name=rs.getString("name");
            String description=rs.getString("description");
            Categories cat;
                cat = new Categories(cid, name, description);
            list.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    return list;
    }
    
    public boolean savePost(Post post){
    boolean status=false;
    
    try{
    String query="insert into post ( pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
    
        PreparedStatement pst= c.prepareStatement(query);
        pst.setString(1, post.getpTitle());
        pst.setString(2, post.getpContent());
        pst.setString(3, post.getpCode());
        pst.setString(4, post.getpPic());
        pst.setInt(5, post.getCatId());
        pst.setInt(6, post.getUserId());
        pst.executeUpdate();
        status=true;
    }
    catch(Exception e){
    e.printStackTrace();
    }
    
    return  status;
    }
     
}
