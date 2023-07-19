<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Books" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Afra Ibnat Tethye
  Date: 7/6/2023
  Time: 12:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>E-Library</title>
    <%@include file="allContent/allCSS.jsp" %>
      <style type="text/css">
          .homebg{
              background: url("img/wallbook.jpg");
              background-repeat: no-repeat;
              background-size: cover;
              height: 300px;
              width: 100%;
          }

          .card-ho{
              border-radius: 40px;
          }

          .card-ho:hover{
              background-color: grey;
          }


          h1 {
              color: #000000;
              font-size: 56px;
          }
          h1:hover {
              -webkit-text-stroke: 2px cadetblue;
              color: transparent;
          }


      </style>
 | </head>
  <body>


  <%
      User u = (User)session.getAttribute("userobj");
  %>

     <%@include file="allContent/navbar.jsp"%>
     <div class="container-fluid homebg">
         <c:if test="${not empty addcart}">
             <p class="text-center bg-dark text-white" style="font-weight: 500">
                     ${addcart}
             </p>
             <c:remove var="succMsg" scope="session"/>

         </c:if>
         <%--ne null--%>
         <c:if test="${not empty failedMsg}">
             <p class="text-center bg-dark text-white" style="font-weight: 500">
                     ${failedMsg}
             </p>
             <c:remove var="failedMsg" scope="session"/>
         </c:if>
         <h1 class="text-center p-5">E-book Center</h1>

     </div>
     <hr>
     <div class="container-fluid" style="background-color: lightsteelblue">
         <h3 class="text-center m-4">Recent Books</h3>
         <div class="row">

             <%

                 bookDAOImpl dao = new bookDAOImpl(DBConnection.getConn());
                 List<Books> list = dao.getRecentBooks();
                 int i = 1;
                 for(Books b : list){
                     if(i>4){
                         break;
                     }

             %>

             <div class="col-md-3">
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
                     ++i;

                 }
             %>


         </div>
         <div class="text-center mt-1">
             <a href="RecentBook.jsp" class="btn btn-danger btn-sm text-white m-3">View All Books</a>
         </div>

     </div>
     <hr>

     <div class="container-fluid" style="background-color: lightsteelblue">
         <h3 class="text-center m-4">New Books</h3>
         <div class="row">


             <%

                 List<Books> list1 = dao.getNewBooks();
                 int j = 1;
                 for(Books b : list1){
                     if(j>4){
                         break;
                     }

             %>

             <div class="col-md-3">
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
                ++j;

                 }
             %>


         </div>
         <div class="text-center mt-1">
             <a href="NewBook.jsp" class="btn btn-danger btn-sm text-white m-3">View All Books</a>
         </div>

     </div>

   <hr>
     <div class="container-fluid" style="background-color: lightsteelblue">
         <h3 class="text-center m-4">Old Books</h3>
         <div class="row">

             <%

                 List<Books> list2 = dao.getOldBooks();
                 int k = 1;
                 for(Books b : list2){
                     if(k>4){
                         break;
                     }

             %>

             <div class="col-md-3">
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
                     ++k;

                 }
             %>



         </div>
         <div class="text-center mt-1">
             <a href="OldBook.jsp" class="btn btn-danger btn-sm text-white m-3">View All Books</a>
         </div>

     </div>

  <%@include file="allContent/footer.jsp"%>


  </body>
</html>
