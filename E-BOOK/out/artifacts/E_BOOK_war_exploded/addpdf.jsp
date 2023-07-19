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
    <title>Add Book PDF</title>
    <%@include file="allContent/allCSS.jsp"%>
    <style>
        a{
            text-decoration: none;
        }
        a:hover{
            text-decoration: none;
            color: crimson;
        }

        .cd {
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
                    <h4 class="text-center text-primary p-2">Add Book PDF</h4>
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
                    <form action="AddPdfServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" value="${userobj.name}" name="uname">
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Book Name</label>
                            <input type="text" class="form-control" id="exampleInputid" aria-describedby="emailHelp" placeholder="Book Name" name="bname" required>

                        </div>
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Author Name</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Author name" name="aname" required>

                        </div>

                        <div class="form-group m-2">
                            <label for="Example">Upload Photo</label>
                            <input name="bimg" type="file" class="form-control-file" id="Example">
                        </div>

                        <div class="form-group m-2">
                            <label for="Example1">Upload PDF</label>
                            <input name="bpdf" type="file" class="form-control-file" id="Example1">
                        </div>


                        <button type="submit" class="btn btn-primary m-2 text-center">Upload</button>
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
