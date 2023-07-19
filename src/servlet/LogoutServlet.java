package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session =  request.getSession();
            session.removeAttribute("userobj");

            HttpSession session1 = request.getSession();
            session.setAttribute("sussMsg", "Logout Successfully!");
            response.sendRedirect("login.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
