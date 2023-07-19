package servlet;

import DAO.CartDAOImpl;
import DAO.bookDAOImpl;
import DB.DBConnection;
import entity.Books;
import entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            int bid = Integer.parseInt(request.getParameter("bid"));
            int uid = Integer.parseInt(request.getParameter("uid"));

            bookDAOImpl bdao = new bookDAOImpl(DBConnection.getConn());
            Books b = bdao.getBookbyID(bid);



            Cart c = new Cart();
            c.setBid(bid);
            c.setUid(uid);
            c.setBname(b.getBname());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalprice(Double.parseDouble(b.getPrice()));

            CartDAOImpl cdao = new CartDAOImpl(DBConnection.getConn());
             boolean f = cdao.addCart(c);

            HttpSession session = request.getSession();


             if(f){

                 session.setAttribute("addcart", "Book Added to cart!");
                 response.sendRedirect("index.jsp");
                 System.out.println("Add Cart Success");


             }else{
                 session.setAttribute("failedMsg", "Something went wrong!");
                 response.sendRedirect("index.jsp");
                 System.out.println("not add to cart");
             }

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
