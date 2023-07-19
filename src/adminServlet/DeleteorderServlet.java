package adminServlet;

import DAO.OrderDAOImpl;
import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DeleteorderServlet")
public class DeleteorderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int id = Integer.parseInt(request.getParameter("id"));

        OrderDAOImpl dao = new OrderDAOImpl(DBConnection.getConn());
        boolean f= dao.DeleteOrder(id);

        HttpSession session = request.getSession();


        if(f){
            session.setAttribute("succMsg", "Book Removed from Orders!");
            response.sendRedirect("admin/orders.jsp");
        }
        else{
            session.setAttribute("failedMsg", "Something went wrong!");
            response.sendRedirect("admin/orders.jsp");
        }
    }
}
