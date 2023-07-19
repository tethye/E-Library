package servlet;

import DAO.bookDAOImpl;
import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/OldDeleteServlet")
public class OldDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            int bid = Integer.parseInt(request.getParameter("bid"));
            bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
            boolean f = dao.OldBookDelete(bid);

            HttpSession session = request.getSession();
            if(f){
                session.setAttribute("succMsg", "Book delete Successfully!");
                response.sendRedirect("useroldbooks.jsp");
            }else{
                session.setAttribute("failedMsg", "Something went wrong!");
                response.sendRedirect("useroldbooks.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
