<%@ page import="DAO.OrderDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Order" %><%--
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
    <title>ADMIN: Orders</title>
    <%@include file="allCSS.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container-fluid">

<h3 class="text-center m-3 p-3">Hello, ${userobj.name}</h3>

    <c:if test="${not empty succMsg}">
        <p class="text-center text-success" style="font-weight: 500">
                ${succMsg}
        </p>
        <c:remove var="succMsg" scope="session"/>

    </c:if>
    <c:if test="${not empty failedMsg}">
        <p class="text-center text-success" style="font-weight: 500">
                ${failedMsg}
        </p>
        <c:remove var="failedMsg" scope="session"/>

    </c:if>

<table class="table table-striped ">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Orders ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment type</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>

    <%
        OrderDAOImpl dao = new OrderDAOImpl(DBConnection.getConn());
        List<Order> list = dao.getAllOrder();

        for(Order o : list){
    %>

    <tr>
        <th ><%=o.getOid()%></th>
        <td><%=o.getUname()%></td>
        <td><%=o.getEmail()%></td>
        <td><%=o.getFullad()%></td>
        <td><%=o.getPhno()%></td>
        <td><%=o.getBname()%></td>
        <td><%=o.getAuthor()%></td>
        <td><%=o.getPrice()%></td>
        <td><%=o.getPayment()%></td>
        <td>
            <a href="../DeleteorderServlet?id=<%=o.getId()%>" class="btn btn-sm btn-danger"><i class="fa-regular fa-square-minus"></i>Remove</a>
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
