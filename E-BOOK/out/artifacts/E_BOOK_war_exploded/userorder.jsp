<%@ page import="DAO.OrderDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/17/2023
  Time: 12:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>My Orders</title>
    <%@include file="allContent/allCSS.jsp"%>
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


<table class="table table-striped ">
    <thead class="bg-dark text-white">
    <tr>
        <th scope="col">Orders ID</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment type</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>

    <%
        User u = (User) session.getAttribute("userobj");

        OrderDAOImpl dao = new OrderDAOImpl(DBConnection.getConn());
        List<Order> list = dao.getUserOrder(u.getEmail());

        for(Order o : list){
    %>


    <tr>
        <th><%=o.getOid()%></th>
        <td><%=o.getBname()%></td>
        <td><%=o.getAuthor()%></td>
        <td><%=o.getPrice()%></td>
        <td><%=o.getPayment()%></td>
        <td>
            <a href="OrderDeleteServlet?id=<%=o.getId()%>" class="btn btn-sm btn-danger"><i class="fa-regular fa-square-minus"></i>Remove</a>
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

