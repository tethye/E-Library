package servlet;

import DAO.userDAOImpl;
import DB.DBConnection;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");

            System.out.println("name " + name + " email " + email + " phno " + phno + " password " + password);

            HttpSession session =request.getSession();

            User us = new User();

            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);

            userDAOImpl dao = new userDAOImpl(DBConnection.getConn());

            boolean f = dao.checkpass(id, password);

            if(f){

                boolean f2 = dao.updateProfile(us);
                if(f2){
                    System.out.println("Profile Update Successful");
                    session.setAttribute("succMsg", "Profile Update Successfully!");
                    response.sendRedirect("editprofile.jsp");
                }else{
                    System.out.println("something wrong on server");
                    session.setAttribute("failedMsg", "Something went wrong!");
                    response.sendRedirect("editprofile.jsp");
                }


            }else {
                System.out.println("Please check your password!");
                session.setAttribute("failedMsg", "Please check your password!!");
                response.sendRedirect("editprofile.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
