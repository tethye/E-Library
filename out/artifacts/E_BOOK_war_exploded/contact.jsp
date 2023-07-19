<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/19/2023
  Time: 12:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Contact</title>
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

<%@include file="allContent/navbar.jsp"%>


<div class="container-fluid" style="background-color: lightsteelblue; padding-bottom: 250px;">
    <div class="row p-3">
        <div class="col-md-4 offset-md-4 p-3">
            <div class="card cd">
                <div class="card-body text-center">
                    <div class="text-success">
                        <i class="fa-solid fa-phone-volume fa-5x"></i>
                    </div>
                    <h3>24*7 Service</h3>
                    <h4>Help Center Number</h4>
                    <a href="tel: 01710220316">+8801710220316</a> <br>
                    <a href="index.jsp" class="btn btn-primary">Home</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="allContent/footer.jsp"%>

</body>
</html>