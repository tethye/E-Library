<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/8/2023
  Time: 12:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin: Home</title>
    <%@include file="allCSS.jsp"%>
    <style>
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            background-color: gray;
            color: crimson;
        }
    </style>
</head>

<body>
<%@ include file="nav.jsp"%>


<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<h3 class="text-center m-3 p-4 text-info">Hello Afra</h3>

<div class="container-fluid">
    <div class="row p-5">
        <div class="col-md-3">
            <a href="addbooks.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-book-open-reader fa-3x text-success"></i>
                        <h4>ADD BOOKS</h4>
                        ---------
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="allbooks.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-book-open fa-3x text-primary"></i>
                        <h4>ALL BOOKS</h4>
                        ---------
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="orders.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-bag-shopping fa-3x text-warning"></i>
                        <h4>ORDERS</h4>
                        ---------
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="allPdf.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fa-regular fa-file-pdf fa-3x text-danger"></i>
                        <h4>All PDF</h4>
                        ---------
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>




<%@include file="foot.jsp"%>


</body>

</html>
