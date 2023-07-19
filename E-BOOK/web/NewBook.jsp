<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Books" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/13/2023
  Time: 12:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>New Books</title>
    <%@include file="allContent/allCSS.jsp"%>

    <style>
        .card-ho{
            border-radius: 40px;
        }
        .card-ho:hover{
            background-color: grey;
        }
    </style>
</head>
<body>

<%
    User u = (User)session.getAttribute("userobj");
%>

<%@include file="allContent/navbar.jsp"%>

<div class="Container-fluid" style="background-color: lightsteelblue">
    <h3 class="text-center mb-3">New Books</h3>
    <div class="row">
        <%

            bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
            List<Books> list = dao.getNewBooks();

            for(Books b : list){

        %>
        <div class="col-md-3 my-2">
            <div class="card text-center card-ho">
                <div class="card-body">
                    <img alt="" src="book/<%=b.getPhoto()%>" style="width:150px; height:200px" class="img-thumblin">
                    <p><%=b.getBname()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>Categories: <%=b.getBcate()%></p>
                    <div clas="row">
                        <c:if test="${empty userobj}">
                            <a href="login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                        </c:if>

                        <c:if test="${not empty userobj}">
                            <a href="CartServlet?bid=<%=b.getBid()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                        </c:if>

                        <a href="ViewBook.jsp?bid=<%=b.getBid()%>" class="btn btn-success btn-sm"><i class="fa-solid fa-circle-info"></i>View Details</a>
                        <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-bangladeshi-taka-sign"></i><%=b.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>

        <%
            }
        %>
    </div>

</div>

<%@include file="allContent/footer.jsp"%>

</body>
</html>
