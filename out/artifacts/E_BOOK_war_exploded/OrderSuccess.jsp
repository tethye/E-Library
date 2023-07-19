<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/17/2023
  Time: 1:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Successfully Ordered</title>
    <%@include file="allContent/allCSS.jsp"%>
    <style>
        a:hover{
            text-decoration: none;
        }
        .cd{
            border-radius: 80px;
        }
    </style>
</head>
<body>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>
<%@include file="allContent/navbar.jsp"%>


<div class="container-fluid" style="background-color: lightsteelblue; padding-bottom: 250px;">
    <div class="row p-3">
        <div class="col-md-4 offset-md-4 p-3">
            <div class="card cd">
                <div class="card-body text-center">
                    <div class="text-success">
                        <i class="fa-regular fa-circle-check fa-5x"></i>
                    </div>
                    <h3>Order Successfully done!</h3>
                    <h4>Your order is Succesfully done...</h4>
                    <a href="userorder.jsp" class="btn btn-success m-2"> Your Orders</a>
                    <a href="index.jsp" class="btn btn-primary m-2">Home</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="allContent/footer.jsp"%>

</body>
</html>
