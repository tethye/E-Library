<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/7/2023
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Registration</title>
    <%@include file="allContent/allCSS.jsp"%>
    <style>
        .cd{
            border-radius: 80px;
        }
    </style>
</head>
<body style="background-color: lightsteelblue">
    <%@include file="allContent/navbar.jsp"%>
    <div class="container-fluid" style="background-color: lightsteelblue;">
         <div class="row p-3">
             <div class="col-md-4 offset-md-4 p-3">
                 <div class="card cd">
                     <div class="card-body">
                         <h4 class="text-center">Registration</h4>
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
                         <form action="register" method="post">
                             <div class="form-group m-2">
                                 <label for="exampleInputEmail1">Enter Full Name</label>
                                 <input type="text" class="form-control" id="exampleInputid" aria-describedby="emailHelp" placeholder="Full Name" name="name" required>

                             </div>
                             <div class="form-group m-2">
                                 <label for="exampleInputEmail1">Email address</label>
                                 <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="abc@email.com" name="email" required>

                             </div>
                             <div class="form-group m-2">
                                 <label for="exampleInputEmail1">Phone Number</label>
                                 <input type="number" class="form-control" id="exampleInputphno" aria-describedby="emailHelp" placeholder="0-9" name="phno" required>

                             </div>
                             <div class="form-group m-2">
                                 <label for="exampleInputPassword1">Password</label>
                                 <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Give a strong password" name="password" required>
                             </div>
                             <div class="form-check m-2">
                                 <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                 <label class="form-check-label" for="exampleCheck1">Agree with terms and conditions</label>
                             </div>
                             <button type="submit" class="btn btn-primary m-2 text-center">Submit</button>
                         </form>
                     </div>
                 </div>
             </div>
         </div>
    </div>

    <%@include file="allContent/footer.jsp"%>

</body>
</html>
