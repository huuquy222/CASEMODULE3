<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> Thế Giới Điện Thoại </title>

    <jsp:include page="/layout/css_head.jsp"></jsp:include>

    <link href="/assets\libs\toastr\toastr.min.css" rel="stylesheet" type="text/css">

</head>

<body data-layout="horizontal">

<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
    <jsp:include page="//layout/top_nav.jsp"></jsp:include>
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
                                <a href="/products">List Products</a>
                            </div>
                            <h4 class="page-title"> Form Edit </h4>
                            <h4 class="page-title">Form Edit Product</h4>
                            <div><c:if test="${requestScope['success'] == true}">
                                <ul class="alert alert-success">
                                    <li style="font-size: 15px">Edit success</li>
                                </ul>
                            </c:if></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <form class="form-horizontal" method="post">
                            <c:if test="${requestScope.product != null}">
                                <input type="hidden" name="id" value='${product.getId()}'/>
                            </c:if>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="name">Name</label>
                                <div class="col-md-10">
                                    <input type="text" id="name" class="form-control" name="name"   value="${product.getName()}">

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="color">Color</label>
                                <div class="col-md-10">
                                    <input type="text" id="color" class="form-control" name="color" value="${product.getColor()}">

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="quantity">Quantity</label>
                                <div class="col-md-10">
                                    <input type="text" id="quantity" class="form-control" name="quantity" value="${product.getQuantity()}">

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="price">Price</label>
                                <div class="col-md-10">
                                    <input type="text" id="price" class="form-control" name="price" value="${product.getPrice()}">
                                </div>
                            </div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="image">Image</label>
                                    <div class="col-md-10">
                                        <input type="text" id="image" class="form-control" name="image" value="${product.getImage()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="idcategory">Category</label>
                                    <div class="col-md-10" id="idcategory">
                                        <select name="idcategory" >
                                            <c:forEach items="${applicationScope.categoryList }" var="category">
                                                <c:choose>
                                                    <c:when test="${category.getId() == product.getIdcategory() }">
                                                        <option value="${category.getId() }" selected>${category.getName() }</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${category.getId() }">${category.getName() }</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                               <button onclick="return confirm('Bạn có chắc chắn muốn sửa sản phẩm này?')">Save</button>
                        </form>
                    </div>

                </div>
                <!-- end row -->

            </div>
            <!-- end container-fluid -->

        </div>
        <!-- end content -->



        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <a href="https://www.facebook.com/quy.nguyenhuu.77985"></a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->

    </div>


    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<jsp:include page="/layout/right_bar.jsp"></jsp:include>


<jsp:include page="/layout/footer_js.jsp">
    <jsp:param name="page" value="create"/>
</jsp:include>
<c:if test="${requestScope.success!=null}">
    <script>
        $( document ).ready(function() {
            <% String success= (String) request.getAttribute("success"); %>
            var js_Success="<%= success %>";
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": false,
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
            toastr["success"](js_Success)
        });
    </script>
</c:if>

</body>


</html>
