<%@ page import="DAO.CartDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.User" %>
<%@ page import="entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cart</title>
    <%@include file="allContent/allCSS.jsp" %>
    <style>
        .cd{
            border-radius: 80px;
        }
    </style>
</head>
<body>

<c:if test="${empty userobj}">
    <c:redirect url = "login.jsp"></c:redirect>
</c:if>
    <%@include file="allContent/navbar.jsp"%>


    <div class="container-fluid" style="background-color: lightsteelblue">
        <div class="row p-2">
            <div class="col-md-6">
                <div class="card bg-white cd">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Selected Item</h3>

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

                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Book Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Price</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%

                                User u = (User) session.getAttribute("userobj");

                                CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
                                List<Cart> carts = dao.getBooksbyUser(u.getId());
                                double totalPrice = 0;

                                for(Cart c:carts){
                                    totalPrice = c.getTotalprice();

                            %>
                            <tr>
                                <th ><%=c.getBname()%></th>
                                <td><%=c.getAuthor()%></td>
                                <td><%=c.getPrice()%></td>
                                <td>
                                    <a href="remove?bid=<%=c.getBid()%>&&uid=<%=u.getId()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger"><i class="fa-regular fa-square-minus"></i>Remove</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <th >Total Price</th>
                                <td></td>
                                <td></td>
                                <td>
                                    <%=totalPrice%>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>


            <div class="col-md-6">
                <div class="card cd">
                    <div class="card-body">
                        <h3 class="text-center text-primary">
                            Your Details for order
                        </h3>
                        <c:if test="${not empty warning }">
                            <p class="text-center text-danger" style="font-weight: 500">
                                    ${warning}
                            </p>
                            <c:remove var="warning" scope="session"/>
                        </c:if>
                        <c:if test="${not empty failedoMsg }">
                            <p class="text-center text-danger" style="font-weight: 500">
                                    ${failedoMsg}
                            </p>
                            <c:remove var="failedoMsg" scope="session"/>
                        </c:if>
                        <form action="OrderServlet" method="post">

                            <input type="hidden" value="${userobj.id}" name="id">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputName">Name</label>
                                    <input type="text" class="form-control" id="inputName" value="<%=u.getName()%>" name="uname" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputemail">Email</label>
                                    <input type="Email" class="form-control" id="inputemail" value="<%=u.getEmail()%>" name="email" readonly>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputphno">Phone Number</label>
                                    <input type="text" class="form-control" id="inputphno" value="<%=u.getPhno()%>" name="phno" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputAddress">Address</label>
                                    <input type="text" class="form-control" id="inputAddress" name="address" value="<%=u.getAdress()%>" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputlandmark">Landmark</label>
                                    <input type="text" class="form-control" id="inputlandmark" name="landmark" value="<%=u.getLandmark()%>" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputcity">City</label>
                                    <input type="text" class="form-control" id="inputcity" name="city" value="<%=u.getCity()%>" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputstate">State</label>
                                    <input type="text" class="form-control" id="inputstate" name="state" value="<%=u.getState()%>" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputzip">Zip</label>
                                    <input type="text" class="form-control" id="inputzip" name="zip" value="<%=u.getZip()%>" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputState1">Payment Method</label>
                                <select id = "inputState1" name ="payment" class="form-control">
                                    <option value="NoSelect">--select--</option>
                                    <option value="Cash on Delivery">Cash on Delivery</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button class="btn btn-warning">Order now</button>
                                <a href="index.jsp" class="btn btn-primary">Continue Shopping</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="allContent/footer.jsp"%>
</body>
</html>