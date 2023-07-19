<%@ page import="DAO.bookDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Books" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="DAO.pdfDAOImpl" %>
<%@ page import="entity.PdfBook" %><%--
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
    <title>Pdfs</title>
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

<%@include file="allContent/navpdf.jsp"%>

<div class="Container-fluid" style="background-color: lightsteelblue">
    <h3 class="text-center mb-3">Portable Document Format(PDF)</h3>
    <div class="row">
        <%

            pdfDAOImpl dao = new pdfDAOImpl(DBConnection.getConn());
            List<PdfBook> list = dao.getAllPdf();

            for(PdfBook p : list){

        %>
        <div class="col-md-3 my-2">
            <div class="card text-center card-ho">
                <div class="card-body">
                    <img alt="" src="book/<%=p.getPhoto()%>" style="width:150px; height:200px" class="img-thumblin">
                    <h5 class="text-success"><%=p.getBname()%></h5>
                    <h6 class="text-danger"><%=p.getAuthor()%></h6>
                    <div clas="row">
                        <a href="book/<%=p.getPdf()%>" class="btn btn-primary btn-sm">Download</a>
                    </div>
                    <p class="text-info">Uploaded by <%=p.getUname()%></p>
                </div>
            </div>
        </div>

        <%
            }
        %>
    </div>

    <div class="text-center mt-1">
        <a href="addpdf.jsp" class="btn btn-danger text-white m-3">Add Book PDF</a>
    </div>

</div>

<%@include file="allContent/footer.jsp"%>

</body>
</html>

