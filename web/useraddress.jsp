<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/17/2023
  Time: 12:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Address</title>
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
        <div class="col-md-6 offset-md-3 p-3">
            <div class="card cd">
                <div class="card-body">
                    <h4 class="text-center text-primary p-3">Add Address</h4>
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
                    <form action="LocationServlet" method="post">
                        <input type="hidden" value="${userobj.id}" name="id">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputAddress">Address</label>
                                <input type="text" class="form-control" id="inputAddress" value="${userobj.adress}" name="address">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputphno">Landmark</label>
                                <input type="text" class="form-control" id="inputphno" value="${userobj.landmark}" name="landmark">
                            </div>

                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-4">
                                <label for="inputcity">City</label>
                                <input type="text" class="form-control" id="inputcity" name="city" value="${userobj.city}">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="inputlandmark">State</label>
                                <input type="text" class="form-control" id="inputlandmark" name="state" value="${userobj.state}">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="inputcity1">Pin Code</label>
                                <input type="text" class="form-control" id="inputcity1" name="zip" value="${userobj.zip}">
                            </div>
                        </div>

                        <div class="text-center">
                            <button class="btn btn-danger text-white">Add address</button>
                        </div>

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
