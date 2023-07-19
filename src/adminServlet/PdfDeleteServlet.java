package adminServlet;

import DAO.pdfDAOImpl;
import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/PdfDeleteServlet")
public class PdfDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            int id = Integer.parseInt(request.getParameter("id"));


            pdfDAOImpl dao = new pdfDAOImpl(DBConnection.getConn());
            boolean f = dao.DeletePDF(id);

            HttpSession session = request.getSession();

            if(f){
                session.setAttribute("succMsg", "PDF delete Successfully!");
                response.sendRedirect("admin/allPdf.jsp");
            }else{
                session.setAttribute("failedMsg", "Something went wrong!");
                response.sendRedirect("admin/allPdf.jsp");
            }



        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
