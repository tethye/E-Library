package servlet;

import DAO.CartDAOImpl;
import DAO.OrderDAOImpl;
import DB.DBConnection;
import entity.Books;
import entity.Cart;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         try {
             int id = Integer.parseInt(request.getParameter("id"));

             String uname = request.getParameter("uname");
             String email = request.getParameter("email");
             String phno = request.getParameter("phno");
             String address = request.getParameter("address");
             String landmark = request.getParameter("landmark");
             String city = request.getParameter("city");
             String state = request.getParameter("state");
             String zip = request.getParameter("zip");
             String payment = request.getParameter("payment");

             String fullad = address + " " + landmark + " " + city + " " + state+ " " + zip;

             System.out.println(uname+ " " + email + " " + phno + " " +  address + " " + landmark + " " + city + " " + state+ " " + zip);

             CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
             List<Cart> list = dao.getBooksbyUser(id);

             OrderDAOImpl da = new OrderDAOImpl(DBConnection.getConn());


             Random r = new Random();


             Order o = null;
             List<Order> olist = new ArrayList<Order>();

             for(Cart c : list){
                 o = new Order();

                 o.setOid("Order ID: " + r.nextInt(1000));
                 o.setUname(uname);
                 o.setEmail(email);
                 o.setPhno(phno);
                 o.setFullad(fullad);
                 o.setBname(c.getBname());
                 o.setAuthor(c.getAuthor());
                 o.setPrice(c.getPrice()+"");
                 o.setPayment(payment);

                 olist.add(o);


             }

             HttpSession session = request.getSession();
             if("NoSelect".equals(payment)){
                 session.setAttribute("warning", "Please select a payment method!");
                 response.sendRedirect("cart.jsp");
             }else {

                 boolean f = da.saveorder(olist);

                 if(f){
                     session.setAttribute("succMsg", "Order successfully done!");
                     response.sendRedirect("OrderSuccess.jsp");
                     System.out.println("Order Success!");
                 }else{
                     System.out.println("Order not done");
                     session.setAttribute("failedoMsg", "Something went wrong!");
                     response.sendRedirect("cart.jsp");
                 }

             }

         }catch (Exception e){
             e.printStackTrace();
         }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
