<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/7/2023
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Log in</title>
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
    <%@include file="allContent/navbar.jsp"%>
    <div class="container-fluid" style="background-color: lightsteelblue; padding-bottom: 300px" >
        <div class="row p-5">
            <div class="col-md-4 offset-md-4 p-3">
                <div class="card cd">
                    <div class="card-body">
                        <h4 class="text-center">Log in</h4>
                        <c:if test="${not empty failedMsg}">
                            <h5 class="text-center text-danger">${failedMsg}</h5>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <h5 class="text-center text-success">${succMsg}</h5>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>
                        <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name = "email" required>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name ="password" required>
                            </div>

                           <div class="text-center">
                               <button type="submit" class="btn btn-primary">Log in</button>
                               <br>

                               <a href="regis.jsp" class=" p-2 m-2">Create a new account</a>
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
