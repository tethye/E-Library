<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Books" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/10/2023
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>ADMIN: All Books</title>
    <%@include file="allCSS.jsp"%>

</head>
<body>
    <%@include file="nav.jsp"%>

    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>

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
                <th scope="col">ID</th>
                <th scope="col">Image</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Categories</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
                List<Books> list = dao.getAllbooks();

                for(Books b : list){
            %>
            <tr>
                <th ><%=b.getBid() %></th>
                <td> <img src ="../book/<%=b.getPhoto()%>" style="width: 50px; height: 50px" ></td>
                <td><%=b.getBname()%></td>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getPrice()%></td>
                <td><%=b.getBcate()%></td>
                <td><%=b.getStatus()%></td>
                <td>
                    <a href="editBook.jsp?id=<%=b.getBid()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
                    <a href="../BookDeleteServlet?id=<%=b.getBid()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-delete-left"></i>Delete</a>

                </td>
            </tr>
            <%
                }
            %>


            </tbody>
        </table>
    </div>

    <%@include file="foot.jsp"%>



</body>
</html>
