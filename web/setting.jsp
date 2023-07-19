<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/16/2023
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Setting</title>
    <%@include file="allContent/allCSS.jsp" %>
    <style>
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: crimson;
            border-radius: 70px;
        }

        .cd{
             border-radius: 70px;
        }

    </style>
</head>
<body>
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>
    <%@include file="allContent/navbar.jsp"%>

    <div class="container-fluid" style="background-color: lightsteelblue; padding-bottom: 300px">
        <h3 class="text-center text-primary p-3"> Hello, ${userobj.name}</h3>
        <div class="row p-3">
            <div class="col-md-4 p-3">
                <a href="sellbook.jsp">
                    <div class="card cd">
                        <div class="card-body text-center">
                            <div class="text-primary">
                                <i class="fa-solid fa-book-open fa-3x"></i>
                            </div>
                            <h3>Sell Old Book</h3>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="useroldbooks.jsp">
                    <div class="card cd">
                        <div class="card-body text-center">
                            <div class="text-primary">
                                <i class="fa-solid fa-book-open-reader fa-3x"></i>
                            </div>
                            <h3>My Old Books</h3>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-3">
                <a href="editprofile.jsp">
                    <div class="card cd">
                        <div class="card-body text-center">
                            <div class="text-primary">
                                <i class="fa-solid fa-shield-halved fa-3x"></i>
                            </div>
                            <h4>Edit Profile</h4>
                        </div>
                    </div>
                </a>
            </div>


            <div class="col-md-4 mt-3">
                <a href="useraddress.jsp">
                    <div class="card cd">
                        <div class="card-body text-center">
                            <div class="text-warning">
                            <i class="fa-solid fa-map-location-dot fa-3x"></i>
                            </div>
                            <h4>Location</h4>
                          </div>
                    </div>
                  </a>
            </div>


            <div class="col-md-4 mt-3">
                <a href="userorder.jsp">
                    <div class="card cd">
                        <div class="card-body text-center">
                            <div class="text-danger">
                                <i class="fa-solid fa-box-open fa-3x"></i>
                            </div>
                            <h4>Track My Orders</h4>
                        </div>
                    </div>
                </a>
            </div>


            <div class="col-md-4 mt-3">
                <a href="helppage.jsp">
                    <div class="card cd">
                        <div class="card-body text-center">
                            <div class="text-info">
                                <i class="fa-solid fa-hand-holding-hand fa-3x"></i>
                            </div>
                            <h4>Help Center</h4>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>

    <%@include file="allContent/footer.jsp"%>
</body>
</html>
