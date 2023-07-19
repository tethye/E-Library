<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Books" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.pdfDAOImpl" %>
<%@ page import="entity.PdfBook" %><%--
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
    <title>ADMIN: All PDF</title>
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
            <th scope="col">User Name</th>
            <th scope="col">PDF</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            pdfDAOImpl dao = new pdfDAOImpl(DBConnection.getConn());
            List<PdfBook> list = dao.getAllPdf();

            for(PdfBook p : list){
        %>
        <tr>
            <th ><%=p.getPid() %></th>
            <td> <img src ="../book/<%=p.getPhoto()%>" style="width: 50px; height: 50px" ></td>
            <td><%=p.getBname()%></td>
            <td><%=p.getAuthor()%></td>
            <td><%=p.getUname()%></td>
            <td><a href="book/<%=p.getPdf()%>" class="btn btn-primary btn-sm">Download</a></td>
            <td>
                <a href="../PdfDeleteServlet?id=<%=p.getPid()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-delete-left"></i>Delete</a>

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
