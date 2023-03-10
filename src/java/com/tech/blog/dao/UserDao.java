package com.tech.blog.dao;

import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

// method to insert user to database
    public boolean saveUser(User user) {
        boolean status = false;
        try {
            //user-->database

            String query = "insert into users(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAbout());
            pst.executeUpdate();
            status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public User getUserByEmailandPassword(String email, String password) {

        User user = null;
        try {
            String query = "select * from users where email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            // System.out.println(email);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setId(rs.getInt("id"));
                user.setDatetime(rs.getTimestamp("r_date"));
                user.setProfile(rs.getString("profile"));
                user.setAbout(rs.getString("about"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean status = false;
        try {
            String query = "update users set name=?, password=? ,email=? ,gender=? ,about=? ,profile=? where id=? ";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAbout());
            pst.setString(6, user.getProfile());
            pst.setInt(7, user.getId());
            pst.executeUpdate();
            status=true;

        } catch (Exception e) {
        }
        return status;
    }

    
    public User getUserByPostId(int userId){
    User user=null;
    
        try {
            String query="select * from users where id='"+userId+"'";
            ResultSet rs=con.createStatement().executeQuery(query);
            if(rs.next()){
            user=new User();
            user.setName(rs.getString("name"));
            }
        } catch (Exception e) {
        }
    
    return user;
            
    }
}
