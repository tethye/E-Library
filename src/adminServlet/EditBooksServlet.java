package adminServlet;

import DAO.bookDAOImpl;
import DB.DBConnection;
import entity.Books;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/EditBooksServlet")
public class EditBooksServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int id = Integer.parseInt(request.getParameter("id"));

            String bname = request.getParameter("bname");
            String author = request.getParameter("aname");
            String price = request.getParameter("price");
            String status = request.getParameter("bstatus");

            Books b = new Books();
            b.setBid(id);
            b.setBname(bname);
            b.setAuthor(author);
            b.setPrice(price);
            b.setStatus(status);

            bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
            boolean f = dao.editbook(b);

            HttpSession session = request.getSession();

            if(f){
                session.setAttribute("succMsg", "Book details update Successfully!");
                response.sendRedirect("admin/allbooks.jsp");
            }else{
                session.setAttribute("failedMsg", "Something went wrong!");
                response.sendRedirect("admin/editBook.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
