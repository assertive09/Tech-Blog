package com.tech.blog.servlets;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author 91904
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            //fetching all the data
            String userEmail=request.getParameter("user_email");
            String userName=request.getParameter("user_name");
            String userPassword=request.getParameter("user_password");
            String userAbout=request.getParameter("user_about");
         
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            
            //get the old user from session
            
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            String oldFile=user.getProfile();
            user.setProfile(imageName);
            user.setId(user.getId());
            
            //updating to database
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            String oldPath=request.getRealPath("/")+"pics"+File.separator+oldFile;
            
            if(dao.updateUser(user)){
            out.println("updated to db");
            String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
               if(!oldFile.equals("default.png")){
               Helper.deleteFile(oldFile);
               }
                if(Helper.saveFile(part.getInputStream(), path)){
                  out.println("Profile pic updated");
                   Message msg=new Message("Profile Updated", "alert success", "alert-success");
                   request.getSession().setAttribute("msg", msg);
                   response.sendRedirect("profile_page.jsp");
                }
                else{
                 Message msg=new Message("Something went wrong", "alert error", "alert-danger");
                   request.getSession().setAttribute("msg", msg);
                   response.sendRedirect("profile_page.jsp");
                }
            }
            else{
            out.println("not updated");
                             Message msg=new Message("Something went wrong", "alert error", "alert-danger");
                   request.getSession().setAttribute("msg", msg);
                   response.sendRedirect("profile_page.jsp");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
