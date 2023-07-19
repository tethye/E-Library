package servlet;

import DAO.userDAOImpl;
import DB.DBConnection;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LocationServlet")
public class LocationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            String address = request.getParameter("address");
            String landmark = request.getParameter("landmark");
            String city =request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");

            HttpSession session =request.getSession();

            User us = new User();

            us.setId(id);
            us.setAdress(address);
            us.setLandmark(landmark);
            us.setCity(city);
            us.setState(state);
            us.setZip(zip);

            userDAOImpl dao = new userDAOImpl(DBConnection.getConn());

            boolean f = dao.updatelocation(us);

            if(f){
                session.setAttribute("succMsg", "Location Update Successfully!");
                response.sendRedirect("useraddress.jsp");
            }else{
                session.setAttribute("failedMsg", "Something went wrong!");
                response.sendRedirect("useraddress.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
