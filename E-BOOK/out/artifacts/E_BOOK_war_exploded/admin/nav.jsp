
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<div class = "container-fluid" style="background-color: cadetblue; height: 10px;"></div>

<div class = "container-fluid">
    <div class = "row p-2">
        <div class = "col-md-4 text-success">  <h3><i class="fa-solid fa-book-atlas"></i>E-Library</h3> </div>


        <div class="col-md-5">
            <form class="form-inline" action="../search.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>

        </div>
        <%--<div class="col-md-1">--%>
            <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
        <%--</div>--%>



        <div class = "col-md-3">

            <c:if test="${not empty userobj}">
                <a href="home.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-face-meh"></i>${userobj.name}</a>
                <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger text-white"><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</a>
            </c:if>
            <c:if test="${empty userobj}">
                <a href="../login.jsp" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i>Log in</a>
                <a href="../regis.jsp" class="btn btn-success text-white"><i class="fa-solid fa-user-plus"></i>Sign up</a>
            </c:if>

        </div>



    </div>

</div>




<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Do You want to Log out?</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../LogoutServlet" type="button" class="btn btn-danger text-white">Log out</a>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<!-- End Modal -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="../index.jsp"><i class="fa-solid fa-house-chimney-user"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="../RecentBook.jsp"><i class="fa-solid fa-book-open-reader"></i>Recent Book</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="../NewBook.jsp"><i class="fa-solid fa-book-open-reader"></i>New Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="../OldBook.jsp"> <i class="fa-solid fa-book-open-reader"></i> Old Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="../pdfpage.jsp"> <i class="fa-solid fa-file-pdf"></i> PDF</a>
            </li>

        </ul>
        <from class="form-inline my-2 my-lg-0">
            <a href="../setting.jsp" class="btn btn-light mx-1 my-2 my-sm-0" type = "submit"><i class="fa-solid fa-gear"></i>Setting</a>
            <a href="../contact.jsp" class="btn btn-light mx-1 my-2 my-sm-0" type="submit"><i class="fa-solid fa-address-book"></i>Contact us</a>
        </from>

    </div>
</nav>