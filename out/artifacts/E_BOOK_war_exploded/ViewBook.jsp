<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Books" %><%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/13/2023
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Book</title>
    <%@include file="allContent/allCSS.jsp"%>
    <style>
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

<%
    int id = Integer.parseInt(request.getParameter("bid"));
    bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
    Books b = dao.getBookbyID(id);

%>


<div class="container-fluid" style="background-color: lightsteelblue">
    <div class="row p-5">
        <div class="col-md-6 text-center p-3 border bg-white cd">
            <img src="book/<%=b.getPhoto()%>" style="height: 200px; width: 150px"><br>
            <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBname()%></span> </h4>
            <h4>Author Name:<span class="text-success"><%=b.getAuthor()%></span></h4>
            <h4>Calegory: <span class="text-success"><%=b.getBcate()%></span></h4>
        </div>

        <div class="col-md-6 text-center p-5 border bg-white cd">
            <h2><%=b.getBname()%></h2>

            <%
                if("Old".equals(b.getBcate())){
            %>
            <h4>Contact to Seller</h4>
            <h5>
                Email: <a href="mailto: <%=b.getUseremail()%>" class="text-success"><i class="fa-regular fa-paper-plane"></i><%=b.getUseremail()%></a>
            </h5>
            <%
                }
            %>

            <div class="row mt-3">
                <div class="col-md-4 text-danger text center p-2">
                    <i class="fa-solid fa-money-bill-wave fa-2x"></i>
                    <p>Cash on Delivery</p>
                </div>
                <div class="col-md-4 text-danger text center p-2">
                    <i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
                    <p>Return Available</p>

                </div>
                <div class="col-md-4 text-danger text center p-2">
                    <i class="fa-solid fa-truck fa-2x"></i>
                    <p>Free Shipping</p>
                </div>
            </div>

            <div class="row text-center p-3">
                <a href="" class="btn btn-primary col-md-6"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                <a href="" class="btn btn-danger col-md-6"><i class="fa-solid fa-bangladeshi-taka-sign"></i><%=b.getPrice()%></a>
            </div>
        </div>
    </div>
</div>

<%@include file="allContent/footer.jsp"%>

</body>
</html>
