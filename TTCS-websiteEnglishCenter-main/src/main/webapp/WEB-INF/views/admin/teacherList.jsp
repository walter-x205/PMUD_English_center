<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Teacher List</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/admin/layouts/css.jsp"></jsp:include>
</head>

<body class="sb-nav-fixed">
    <!-- 	header -->
	<jsp:include page="/WEB-INF/views/admin/layouts/header.jsp"></jsp:include>
	<!-- 	header -->
 
    <div id="layoutSidenav">
        <!--Slidebar-->
        <jsp:include page="/WEB-INF/views/admin/layouts/slidebar.jsp"></jsp:include>
        <!--Slidebar-->
        
        <!---This is Content-->
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="row" style="margin-top: 60px;">
                        <div class="mb-2 d-flex justify-content-between align-items-center">
                            <div class="position-relative">
                             <span class="position-absolute search"><i class="fa fa-search"></i></span> 
                             <input class="form-control w-100" placeholder="Search by order#, name..."> 
                            </div>
                            <div class="px-2">
                             <a type="button" class="btn btn-secondary add-button" href="${base }/addNewTeacher"><i class="fas fa-plus"></i>Thêm giảng viên mới</a> 
                             <i class="fa fa-ellipsis-h ms-3"></i>
							</div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                    <tr class="bg-header">
                                        <th scope="col" width="5%">ID</th>
                                        <th scope="col" width="5%">Avartar</th>
                                        <th scope="col" width="10%">Họ Tên</th>
                                        <th scope="col" width="8%">Giới tính</th>
                                        <th scope="col" width="15%">Địa chỉ</th>
                                        <th scope="col" width="10%">SĐT</th>
                                        <th scope="col" width="15%">Email</th>
                                        <th scope="col" width="20%">Mô tả trình độ</th>
                                        <th scope="col" class="text-end" width="10%"><span>Action</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td><img src="" alt="">Img </td>
                                        <td>Chu Ngọc Thủy</td>
                                        <td>Nam</td>
                                        <td>Việt Nam</td>
                                        <td>0.12312312</td>
                                        <td>thuychu@...</td>
                                        <td>provip</td>
                                        <td class="text-end"><a href="${base }/infoTeacher"><i class="fas fa-edit"></i></a> <a href=""><i class="fas fa-times"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!--This is Footer-->
    <jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>