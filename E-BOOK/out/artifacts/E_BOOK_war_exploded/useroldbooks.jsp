<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Books" %><%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/17/2023
  Time: 3:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>My Old Books</title>
    <%@include file="allContent/allCSS.jsp" %>
</head>
<body>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>
    <%@include file="allContent/navbar.jsp"%>



    <div class="container">

        <h3 class="text-center m-3 p-3">Hello, ${userobj.name}</h3>
        <c:if test="${not empty succMsg}">
            <p class="text-center text-success" style="font-weight: 500">
                    ${succMsg}
            </p>
            <c:remove var="succMsg" scope="session"/>

        </c:if>
        <%--ne null--%>
        <c:if test="${not empty failedMsg}">
            <p class="text-center text-danger" style="font-weight: 500">
                    ${failedMsg}
            </p>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>

        <table class="table table-striped ">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Image</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <%

                User u = (User) session.getAttribute("userobj");
                String email = u.getEmail();

                bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
                List<Books> list = dao.getUserOldBooks(email, "Old");

                for(Books b : list){

            %>

            <tr>
                <td> <img src ="book/<%=b.getPhoto()%>" style="width: 50px; height: 50px" ></td>
                <td><%=b.getBname()%></td>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getPrice()%></td>
                <td>
                    <a href="OldDeleteServlet?bid=<%=b.getBid()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>Delete</a>

                </td>
            </tr>

            <%
                }
            %>





            </tbody>
        </table>
    </div>

    <%@include file="allContent/footer.jsp"%>


</body>
</html>
