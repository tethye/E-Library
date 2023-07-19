package servlet;

import DAO.CartDAOImpl;
import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove")
public class RemoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int bid = Integer.parseInt(request.getParameter("bid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        int cid = Integer.parseInt(request.getParameter("cid"));

        CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
        boolean f= dao.RemoveBook(bid, uid, cid);

        HttpSession session = request.getSession();


        if(f){
            session.setAttribute("succMsg", "Book Removed from cart!");
            response.sendRedirect("cart.jsp");
        }
        else{
            session.setAttribute("failedMsg", "Something went wrong!");
            response.sendRedirect("cart.jsp");
        }
    }
}
