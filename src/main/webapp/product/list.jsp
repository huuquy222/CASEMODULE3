<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Thế Giới Di Động</title>

    <jsp:include page="/layout/css_head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
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
                                </ol>
                            </div>
                            <h4 class="page-title">List Product </h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <div class="table-responsive">
                                <table class="table m-0" style="text-align: center">

                                    <thead class="thead-light">
                                    <tr><a href="/products?action=create"><i class="fa-regular fa-square-plus"></i> Add
                                        Product</a></tr>
                                    <tr>
                                        <th>id</th>
                                        <th>name</th>
                                        <th>color</th>
                                        <th>quantity</th>
                                        <th>price</th>
                                        <th>image</th>
                                        <th>category</th>
                                        <th>action</th>
                                    </tr>
                                    <c:forEach var="product" items="${listProduct}">
                                    <tr>
                                        <td><c:out value="${product.id}"/></td>
                                        <td><c:out value="${product.name}"/></td>
                                        <td><c:out value="${product.color}"/></td>
                                        <td><c:out value="${product.quantity}"/></td>
                                        <td>
                                            <c:set var="price" value="${product.getPrice()}"/>
                                            <fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${price}" type="currency"/>
                                        </td>
                                        <td><img src="${product.image}"style="width: 120px; height: 120px"></td>
                                        <td><c:out value="${product.idcategory}"/></td>
                                        <td>
                                            <fmt:setLocale value="fr_CA"/>
                                            <fmt:formatNumber value="${product.price}"/>
                                        </td>
                                        <td>
                                            <a href="/products?action=edit&id=${product.id}"
                                               style="margin-right:25px"><i class="fa-regular fa-pen-to-square"></i>
                                            </a>
                                            <a href="/products?action=delete&id=${product.id}"
                                               onclick="return confirm('Bạn có muốn xóa sản phẩm này?')"><i
                                                    class="fa-regular fa-trash-can"></i> </a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                            <!-- end row -->

                        </div>
                        <!-- end card-box -->
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->

            </div>
            <!-- end container-fluid -->

        </div>
        <!-- end content -->


        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->

    </div>
    <!-- Footer Start -->

    <div>


        <jsp:include page="/layout/footer.jsp"></jsp:include>
    </div>
    <!-- end Footer -->

    <!-- END wrapper -->

    <jsp:include page="/layout/right_bar.jsp"></jsp:include>

    <jsp:include page="/layout/footer_js.jsp">
        <jsp:param name="page" value="list"/>
    </jsp:include>


</body>

</html>

