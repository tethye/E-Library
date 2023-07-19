<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/17/2023
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Profile</title>
    <%@include file="allContent/allCSS.jsp"%>
    <style>
        a{
            text-decoration: none;
        }
        a:hover{
            text-decoration: none;
            color: crimson;
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
<div class="container-fluid" style="background-color: lightsteelblue; padding-bottom: 150px" >
    <div class="row p-3">
        <div class="col-md-4 offset-md-4 p-3">
            <div class="card cd">
                <div class="card-body">
                    <h4 class="text-center text-primary p-2">Edit Profile</h4>
                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success" style="font-weight: 500">
                                ${succMsg}
                        </p>
                        <c:remove var="succMsg" scope="session"/>

                    </c:if>
                    <%--ne null--%>
                    <c:if test="${not empty failedMsg }">
                        <p class="text-center text-danger" style="font-weight: 500">
                                ${failedMsg}
                        </p>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>
                    <form action="UpdateServlet" method="post">
                        <input type="hidden" value="${userobj.id}" name="id">
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Enter Full Name</label>
                            <input type="text" class="form-control" id="exampleInputid" aria-describedby="emailHelp" placeholder="Full Name" name="name" value="${userobj.name}">

                        </div>
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="abc@email.com" name="email" value="${userobj.email}">

                        </div>
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Phone Number</label>
                            <input type="text" class="form-control" id="exampleInputphno" aria-describedby="emailHelp" placeholder="0-9" name="phno" ${userobj.phno}>

                        </div>
                        <div class="form-group m-2">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm your password" name="password" required>
                        </div>

                        <button type="submit" class="btn btn-primary m-2 text-center">Update</button>
                    </form>

                </div>


            </div>
        </div>
    </div>
</div>
<div>
    <%@include file="allContent/footer.jsp"%>
</div>
</body>
</html>
