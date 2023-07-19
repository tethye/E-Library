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

@WebServlet("/register")
public class RegisServlet extends HttpServlet {

   protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
       try{
           String name = req.getParameter("name");
           String email = req.getParameter("email");
           String phno = req.getParameter("phno");
           String password = req.getParameter("password");
           String check = req.getParameter("check");
           System.out.println("name "+ name + " email " + email + " phno " + phno + " password " + password);

           User us = new User();
           us.setName(name);
           us.setEmail(email);
           us.setPhno(phno);
           us.setPassword(password);

           HttpSession session = req.getSession();

           if(check!=null){
               userDAOImpl dao = new userDAOImpl(DBConnection.getConn());
               boolean f = dao.userReg(us);
               if(f){
                   System.out.println("User Registration Successful");
                   session.setAttribute("succMsg", "Registration Successfully!");
                   res.sendRedirect("regis.jsp");
               }
               else{
                   System.out.println("something wrong on server");
                   session.setAttribute("failedMsg", "Something went wrong!");
                   res.sendRedirect("regis.jsp");
               }
           }else{
               System.out.println("Please Agree Treams and Conditions");
               session.setAttribute("failedMsg", "Please Agree with Terms and Conditions!");
               res.sendRedirect("regis.jsp");
           }


       }catch(Exception e){
           e.printStackTrace();
       }

   }
}
