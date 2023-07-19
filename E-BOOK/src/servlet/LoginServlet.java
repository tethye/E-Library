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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{


            String email = request.getParameter("email");
            String password = request.getParameter("password");

            System.out.println("Email = " + email + " password  = " + password);

            userDAOImpl dao = new userDAOImpl(DBConnection.getConn());

            HttpSession session = request.getSession();
            String context = request.getContextPath();

            if ("afraibnat001@gmail.com".equals(email) && "ttt".equals(password)) {
                User us = new User();
                us.setName("Afra Ibnat Tethye");
                session.setAttribute("userobj", us);
                response.sendRedirect(context + "/admin/home.jsp");
            }else{

                User us = dao.login(email, password);
                if(us!=null){
                    session.setAttribute("userobj", us);
                    response.sendRedirect(context + "/index.jsp");
                }else{
                    session.setAttribute("failedMsg", "Email or Password is incorrect!");
                    response.sendRedirect(context + "/login.jsp");
                }
            }


        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
