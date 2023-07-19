package servlet;

import DAO.pdfDAOImpl;
import DB.DBConnection;
import entity.PdfBook;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/AddPdfServlet")
@MultipartConfig

public class AddPdfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String uname = request.getParameter("uname");
            String bname = request.getParameter("bname");
            String author = request.getParameter("aname");
            Part part = request.getPart("bimg");
            Part part1 = request.getPart("bpdf");

            String photo = part.getSubmittedFileName();
            String pdf = part1.getSubmittedFileName();



            PdfBook p = new PdfBook(bname, author, photo, pdf, uname);
            System.out.println(p);

            pdfDAOImpl dao = new pdfDAOImpl(DBConnection.getConn());
            boolean f = dao.addpdf(p);

            HttpSession session = request.getSession();




            if(f){

                String path = getServletContext().getRealPath("")+"book";
                System.out.println(path);

                File file = new File(path);
                part.write(path + File.separator + photo);
                part1.write(path + file.separator + pdf);


                session.setAttribute("succMsg", "Pdf adds successfully!");
                response.sendRedirect("addpdf.jsp");
            }else{
                session.setAttribute("failedMsg", "Sorry, Something went wrong!");
                response.sendRedirect("addpdf.jsp");
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
