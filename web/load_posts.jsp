
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class="row">
    <%
        Thread.sleep(500);
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> list = null;
        if (cid == 0) {
            list = pd.getAllPost();
        } else {
            list = pd.getAllPostByCatId(cid);
        }
       if(list.size()==0){
        %>
        <h3 class="display-3 text-center">No Posts are available in this category</h3>
        <%
            return;
        }
     else{
        for (Post p : list) {

    %>

    <div class="col-md-6 mt-2">
        <div class="card">
             <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            <div  class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>
             
            </div>
                <div class="card-footer primary-background">
<a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up "><span> 20</span></i> </a>
<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
<a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting "><span> 20</span></i> </a>
              
</div>
        </div>
    </div>
    <%
        }
}
    %>
</div> 