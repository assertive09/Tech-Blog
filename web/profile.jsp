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
        <title>Profile Page</title>
    </head>
    <body>
        <h1><%=user.getName()%></h1>
        <h1><%=user.getEmail()%></h1>
        <h1><%=user.getGender()%></h1>
    </body>
</html>
