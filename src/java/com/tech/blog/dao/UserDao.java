
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
       boolean status=false;
    try {
        //user-->database
        
        String query="insert into sign_up(name,email,password,gender,about) values(?,?,?,?,?)";
        PreparedStatement pst= this.con.prepareStatement(query);
        pst.setString(1, user.getName());
        pst.setString(2, user.getEmail());
        pst.setString(3, user.getPassword());
        pst.setString(4, user.getGender());
        pst.setString(5, user.getAbout());
        pst.executeUpdate();
        status=true;
        
    } catch (Exception e) {
    e.printStackTrace();
    }
    return  status;
}   
    
}
