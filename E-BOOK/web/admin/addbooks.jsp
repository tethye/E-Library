<%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/10/2023
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin: Add Books</title>
    <%@ include file="allCSS.jsp"%>
    <style>
        .cd{
            border-radius: 80px;
        }
    </style>
</head>
<body>
   <%@include file="nav.jsp"%>


   <c:if test="${empty userobj}">
       <c:redirect url="../login.jsp"/>
   </c:if>

   <div class="container-fluid" style="background-color: lightsteelblue">
       <div class="row p-3">
           <div class="col-md-4 offset-md-4 p-3">
               <div class="card cd">
                   <div class="card-body">
                       <h4 class="text-center">Add Books</h4>
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
                       <form action="../BooksAddServlet" method="post" enctype="multipart/form-data">
                           <div class="form-group m-2">
                               <label for="exampleInputEmail1">Book Name</label>
                               <input type="text" class="form-control" id="exampleInputid" aria-describedby="emailHelp" placeholder="Book Name" name="bname" required>

                           </div>
                           <div class="form-group m-2">
                               <label for="exampleInputEmail1">Author Name</label>
                               <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Author name" name="aname" required>

                           </div>
                           <div class="form-group m-2">
                               <label for="exampleInputEmail1">Price</label>
                               <input type="number" class="form-control" id="exampleInputphno" aria-describedby="emailHelp" placeholder="0-9" name="price" required>

                           </div>
                           <div class="form-group m-2">
                               <label for="inputState">Book Categories</label>
                               <select id = "inputState" name ="btype" class="form-control">
                                   <option selected>--select--</option>
                                   <option value="New">New Book</option>
                                   <option value="Old">Old Book</option>
                               </select>
                           </div>

                           <div class="form-group m-2">
                               <label for="inputState1">Book Status</label>
                               <select id = "inputState1" name ="bstatus" class="form-control">
                                   <option selected>--select--</option>
                                   <option value="Active">Active</option>
                                   <option value="Inactive">Inactive</option>
                               </select>
                           </div>

                           <div class="form-group m-2">
                               <label for="Example">Upload Photo</label>
                               <input name="bimg" type="file" class="form-control-file" id="Example">
                           </div>

                           <button type="submit" class="btn btn-primary m-2 text-center">ADD</button>
                       </form>

                   </div>


               </div>
           </div>
       </div>
   </div>
   <%@include file="foot.jsp"%>
</body>
</html>
