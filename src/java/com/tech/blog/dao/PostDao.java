package com.tech.blog.dao;

import com.mysql.cj.jdbc.PreparedStatementWrapper;
import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
    
    //get all the post
    public List<Post> getAllPost(){
     List<Post> list=new ArrayList<>();
     
     //fetch all the post
        try {
            String query="select * from post order by pid desc";
            Statement s=c.createStatement();
            ResultSet rs=s.executeQuery(query);
            while(rs.next()){
            
            int pid = rs.getInt("pid");
            String pTitle=rs.getString("pTitle");
            String pContent=rs.getString("pContent");
            String pCode=rs.getString("pCode");
            String pPic=rs.getString("pPic");
            Timestamp pDate=rs.getTimestamp("pDate");
            int catId=rs.getInt("catId");
            int userId=rs.getInt("userId");
            list.add(new Post (pid,pTitle,pCode,pContent,pPic,pDate,catId,userId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Post> getAllPostByCatId(int catId){
     List<Post> list=new ArrayList<>();
     
     //fetch all the post by cat id
        try {
            String query="select * from post where catId='"+catId+"'";
            Statement s=c.createStatement();
            ResultSet rs=s.executeQuery(query);
            while(rs.next()){
            
            int pid = rs.getInt("pid");
            String pTitle=rs.getString("pTitle");
            String pContent=rs.getString("pContent");
            String pCode=rs.getString("pCode");
            String pPic=rs.getString("pPic");
            Timestamp pDate=rs.getTimestamp("pDate");
            int userId=rs.getInt("userId");
            list.add(new Post (pid,pTitle,pCode,pContent,pPic,pDate,catId,userId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     
    
    //when we need Post by pid
    
    public Post getPostById(int pid){
    
        Post post=null;
         try {
           Statement s= c.createStatement();
           ResultSet rs=s.executeQuery("select * from post where pid='"+pid+"'");
           if(rs.next()){
           post = new Post();
           post.setPid(rs.getInt("pid"));
           post.setCatId(rs.getInt("catId"));
           post.setUserId(rs.getInt("userId"));
           post.setpCode(rs.getString("pCode"));
           post.setpContent(rs.getString("pContent"));
           post.setpTitle(rs.getString("pTitle"));
           post.setpPic(rs.getString("pPic"));
           post.setpDate(rs.getTimestamp("pDate"));
           }
        } catch (Exception e) {
        }
        
        
        return post;
    }
    
//   public String userinfo(){
//   
//       String userinfo
//   
//       return info;
//   }
}
