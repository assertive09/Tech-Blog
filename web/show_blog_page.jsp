<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao pd = new PostDao(ConnectionProvider.getConnection());
    Post post = pd.getPostById(postId);
%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .user-info{
                font-size: 20px;
                font-weight: 200px;
            }
            .row-user
            {
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background: url(img/blue-background-images-for-websites.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            
        </style>
        <title><%= post.getpTitle()%>|| TechBlog</title>
    </head>
    <body>
        <!--navbar opening-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-braille"></span> Tech Blog </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile_page.jsp"><span class="fa fa-desktop"></span> Learn Code With Govind <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square"></span>
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
                        <a class="nav-link " href="#"><span class="fa fa-drivers-license"></span> Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#!" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-paper-plane" ></span> Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link " href="#!" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span><%= " " + user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>
        <!--end of navbar-->



        <!--opening of main content of body-->

        <div class="container">

            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= post.getpTitle()%></h4>

                        </div>
                        <div class="card-body">
                            <p class="post-content"><%= post.getpContent()%></p>
                            <br>
                            <div class="post-code">
                            <img src="blog_pics/<%= post.getpPic() %>" class="card-img-top my-2"/>
                            </div>
                              <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <% UserDao u=new UserDao(ConnectionProvider.getConnection()) ;
                                        User post_Username=u.getUserByPostId(post.getUserId());
                                    %>
                                    <p class="user-info"><a href="#!"><%=  post_Username.getName() %></a> Has Posted:</p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%=  DateFormat.getDateTimeInstance().format(post.getpDate()) %> </p>
                                </div>
                            </div>
                            <pre><%= post.getpCode()%></pre>
                        </div>
                        <div class="card-footer primary-background">

                            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up "><span> 20</span></i> </a>
                            <a href="show_blog_page.jsp?post_id=<%= post.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting "><span> 20</span></i> </a>
                        </div> 
                   
                    </div>
                </div>

            </div>
        </div>

        <!--end of main content of body-->

        <!--profile modal--> 


        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">User Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 100px "/>
                            <br>
                            <h5><%= user.getName()%></h5>
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Id</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registration Date</th>
                                            <td><%= user.getDatetime()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="profile-edit" style=" display: none">

                                <h3 class="mt-3">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">

                                    <table class="table">
                                        <tr>
                                            <th>id</th> 
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th>Name</th> 
                                            <td> <input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"/>  </td> 
                                        </tr>
                                        <tr>
                                            <th>Email</th> 
                                            <td> <input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"/>  </td> 
                                        </tr>
                                        <tr>
                                            <th>Password</th> 
                                            <td> <input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>"/>  </td> 
                                        </tr>
                                        <tr>
                                            <th>Gender</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th>About</th> 
                                            <td> <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Profile Pic</th>
                                            <td><input type="file" name="image" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-outline-primary primary-background text-white"> Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="profile-edit-btn" type="button" class="btn btn-outline-primary primary-background text-white ">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal


        <!--post modal-->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form  id="add-post-form" action="AddPostServlet" method="POST">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        PostDao p = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Categories> list = p.getAllCategories();
                                        for (Categories c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" class="form-control" placeholder="Enter Post Title">
                            </div>
                            <div class="form-group">
                                <textarea  name="pContent" class="form-control" placeholder="Enter Your Content" style=" height:100px"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCOde" class="form-control" placeholder="Enter The Code (if any)" style=" height:150px"></textarea>
                            </div>
                            <div class="form-group">
                                Select the picture to upload
                                <br>
                                <input type="file" name="pic">
                            </div>
                            <div class="container text-center"> 
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of post model-->

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#profile-edit-btn').click(function () {

                    if (editStatus == false) {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        $(this).text("Back")
                        editStatus = true;
                    } else {

                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        $(this).text("Edit")
                        editStatus = false;
                    }


                })
            })
        </script>

        <!--adding post js-->
        <script>
            $(document).ready(function (e) {

                $('#add-post-form').on("submit", function (event) {
                    console.log("clicked");
                    //this code gets called when form is submitted.
                    event.preventDefault();
                    let form = new FormData(this);

//               now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //console.log(data);
                            if (data.trim() === 'done') {
                                console.log("Success");
                                swal("Sucess", "Post Uploaded", "success");
                            } else {
                                swal("Error", "Post Not Uploaded", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error", "Post Not Uploaded", "error");
                        },
                        processData: false,
                        contentType: false
                    })

                })
            })

        </script>



    </body>
</html>
