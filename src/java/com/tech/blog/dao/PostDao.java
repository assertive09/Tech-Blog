package com.tech.blog.dao;

import com.tech.blog.entities.Categories;
import java.sql.Connection;
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
     
}
