<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang Quản Lý Người Dùng</title>
    <jsp:include page="/layout/css_head.jsp"></jsp:include>
    <link href="/assets\libs\toastr\toastr.min.css" rel="stylesheet" type="text/css">

</head>

<body data-layout="horizontal">


<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
    <jsp:include page="/layout/top_nav.jsp"></jsp:include>
    <!-- End Navigation Bar-->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <a href="/users">List Users</a>
                                </ol>
                            </div>
                            <h4 class="page-title">Form Add User</h4>
                            <div>
                                <c:if test="${requestScope['success'] == true}">
                                    <span class="alert alert-success "
                                          style="font-size: 15px">Add success</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <h4 class="header-title"></h4>
                            <form class="form-horizontal" method="post" action="/users?action=create">
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="name">Name</label>
                                    <div class="col-md-10">
                                        <input type="text" id="name" name="name" class="form-control" placeholder="Name">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="email">Email</label>
                                    <div class="col-md-10">
                                        <input type="text" id="email" name="email" class="form-control" placeholder="Email">
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="password">Password</label>
                                    <div class="col-md-10">
                                        <input type="text" id="password" class="form-control" name="password" value="${user.getPassword()}">

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="country">Country</label>
                                    <div class="col-md-10" id="country">
                                        <select name="idcountry">
                                            <c:forEach items="${applicationScope.countryList }" var="country">
                                                <c:choose>
                                                    <c:when test="${country.getId() == user.getId() }">
                                                        <option value="${country.getId() }" selected>${country.getName() }</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${country.getId() }">${country.getName() }</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="address">Address</label>
                                    <div class="col-md-10">
                                        <input type="text" id="address" name="address" class="form-control" placeholder="Address">
                                    </div>
                                </div>



                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="idrole">Idrole</label>
                                    <div class="col-md-10" id="idrole">
                                        <select name="idrole">
                                            <c:forEach items="${applicationScope.roleList }" var="role">
                                                <c:choose>
                                                    <c:when test="${role.getId() == user.getIdrole() }">
                                                        <option value="${role.getId() }" selected>${role.getName() }</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${role.getId() }">${role.getName() }</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <button onclick="return confirm('Bạn có chắc chắn muốn thêm người dùng này vào danh sách??')">Add User</button>
                            </form>
                            <!-- end row -->


                        </div>
                    </div>
                </div>
                <!-- end row -->

            </div>
            <!-- end container-fluid -->

        </div>
        <!-- end content -->



        <!-- Footer Start -->
        <jsp:include page="/layout/footer.jsp"></jsp:include>
        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<jsp:include page="/layout/right_bar.jsp"></jsp:include>

<c:if test="${requestScope.message !=null}">
    <script>
        window.onload = function(e){
            toastr["success"]("ADD SUCCESS!");
        }
    </script>
</c:if>

<jsp:include page="/layout/footer_js.jsp">
    <jsp:param name="page" value="create"/>
    <jsp:param name="toast" value="create"/>
</jsp:include>
<script>
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
</script>

</body>

</html>
