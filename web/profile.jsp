<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
    response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <style>
            .banner-background{
                clip-path: polygon(50% 0, 100% 0, 100% 95%, 69% 100%, 50% 96%, 31% 100%, 0 96%, 0 35%, 0 0);
            }
        </style>
        <title>Profile Page</title>
    </head>
    <body>
       <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-braille"></span> Tech Blog </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-desktop"></span> Learn Code With Govind <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square	
"></span>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programing Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Structures</a>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link " href="#"><span class="fa fa-drivers-license	
"></span> Contact Us</a>
      </li>
    
    </ul>
      <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link " href="profile.jsp"><span class="fa fa-user-circle"></span><%= " "+user.getName() %></a>
           </li>
            <li class="nav-item">
          <a class="nav-link " href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
           </li>
      </ul>

  </div>
</nav>
    </body>
</html>
