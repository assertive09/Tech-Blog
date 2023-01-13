<%-- 
    Document   : show_blog_page
    Created on : 13-Jan-2023, 11:48:39 pm
    Author     : 91904
--%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%
    int postId=Integer.parseInt(request.getParameter("post_id"));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
       <% 
       PostDao pd=new PostDao(ConnectionProvider.getConnection());
       Post post=pd.getPostById(postId);
       %>
       <img src="blog_pics/<%= post.getpPic()  %>" alt="alt"/>
       <h1><%= post.getpTitle()  %></h1>
    </body>
</html>
