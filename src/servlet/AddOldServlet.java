package servlet;

import DAO.bookDAOImpl;
import DB.DBConnection;
import entity.Books;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/AddOldServlet")
@MultipartConfig
public class AddOldServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String bname = request.getParameter("bname");
            String author = request.getParameter("aname");
            String price = request.getParameter("price");
            String bcate = "Old";
            String status = "Active";
            Part part = request.getPart("bimg");
            String photo = part.getSubmittedFileName();
            String useremail = request.getParameter("useremail");

            Books b = new Books(bname, author, price, bcate, status, photo, useremail);
            System.out.println(b);

            bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());

            boolean f = dao.addBook(b);
            HttpSession session = request.getSession();




            if(f){

                String path = getServletContext().getRealPath("")+"book";
                System.out.println(path);

                File file = new File(path);
                part.write(path + File.separator + photo);


                session.setAttribute("succMsg", "Book adds successfully!");
                response.sendRedirect("sellbook.jsp");
            }else{
                session.setAttribute("failedMsg", "Sorry, Something went wrong!");
                response.sendRedirect("sellbook.jsp");
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
