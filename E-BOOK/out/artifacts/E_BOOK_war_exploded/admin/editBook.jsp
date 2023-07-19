<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Books" %><%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/10/2023
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Admin: Edit Book</title>
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
                    <h4 class="text-center">Edit Books</h4>
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

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
                        Books b = dao.getBookbyID(id);
                    %>

                    <form action="../EditBooksServlet" method="post">
                        <input type="hidden" name="id" value="<%=b.getBid()%>">
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Book Name</label>
                            <input type="text" class="form-control" id="exampleInputid" aria-describedby="emailHelp" placeholder="Book Name" name="bname" value="<%=b.getBname()%>" required>
                        </div>
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Author Name</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Author name" name="aname" value="<%=b.getAuthor()%>" required>

                        </div>
                        <div class="form-group m-2">
                            <label for="exampleInputEmail1">Price</label>
                            <input type="number" class="form-control" id="exampleInputphno" aria-describedby="emailHelp" placeholder="0-9" name="price" value="<%=b.getPrice()%>" required>

                        </div>


                        <div class="form-group m-2">
                            <label for="inputState1">Book Status</label>
                            <select id = "inputState1" name ="bstatus" class="form-control">
                                <%
                                    if("Active".equals(b.getStatus())){
                                %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                                <%
                                    }else{
                                %>
                                <option value="Inactive">Inactive</option>
                                <option value="Active">Active</option>
                                <%
                                    }
                                %>

                            </select>
                        </div>


                        <button type="submit" class="btn btn-primary m-2 text-center">Update</button>
                    </form>

                </div>


            </div>
        </div>
    </div>
</div>
<%@include file="foot.jsp"%>
</body>
</html>
