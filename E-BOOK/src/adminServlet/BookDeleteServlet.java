package adminServlet;

import DAO.bookDAOImpl;
import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/BookDeleteServlet")
public class BookDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            int id = Integer.parseInt(request.getParameter("id"));


            bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
            boolean f = dao.DeleteBook(id);

            HttpSession session = request.getSession();

            if(f){
                session.setAttribute("succMsg", "Book delete Successfully!");
                response.sendRedirect("admin/allbooks.jsp");
            }else{
                session.setAttribute("failedMsg", "Something went wrong!");
                response.sendRedirect("admin/allbooks.jsp");
            }



        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
