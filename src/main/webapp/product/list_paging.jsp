<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>The Gioi Disdsdfsdf Dong</title>

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
                                    <tr> <a href="/products?action=create"><i class="fa-regular fa-square-plus"></i> Add Product</a> </tr>
                                    <tr>
                                        <th>id</th>
                                        <th>name</th>
                                        <th>color</th>
                                        <th>quantity</th>
                                        <th>price</th>
                                        <th>images</th>
                                        <th>idcategory</th>
                                    </tr>
                                    <c:forEach var="product" items="${listProduct}">
                                    <tr>
                                        <td><c:out value="${product.id}"/></td>
                                        <td><c:out value="${product.name}"/></td>
                                        <td><c:out value="${product.color}"/></td>
                                        <td><c:out value="${product.quantity}"/></td>
                                        <td>${product.price}</td>
                                        <td><img src="${product.image}" style="width: 100px;height: 100px"/></td>
                                        <td><c:out value="${product.idcategory }"/></td>


                                        <td>
                                            <c:forEach items="${applicationScope.categoryList}" var="category">
                                                <c:if test="${category.getId()==products.category}">${category.getName()}</c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <a href="/products?action=edit&id=${product.id}" style="margin-right:25px"><i class="fa-regular fa-pen-to-square"></i> </a>
                                            <a href="/products?action=delete&id=${product.id}" onclick="return confirm('Bạn có muốn xóa sản phẩm này?')"><i class="fa-regular fa-trash-can"></i> </a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <%--For displaying Previous link except for the 1st page --%>
                                <c:if test="${currentPage != 1}">
                                    <td><a href="products?page=${currentPage - 1}">Previous</a></td>
                                </c:if>

                                <%--For displaying Page numbers.
                                The when condition does not display a link for the current page--%>
                                <table border="1" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                            <c:choose>
                                                <c:when test="${currentPage eq i}">
                                                    <td>${i}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td><a href="products?page=${i}">${i}</a></td>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </tr>
                                </table>

                                <%--For displaying Next link --%>
                                <c:if test="${currentPage lt noOfPages}">
                                    <td><a href="products?page=${currentPage + 1}">Next</a></td>
                                </c:if>
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


