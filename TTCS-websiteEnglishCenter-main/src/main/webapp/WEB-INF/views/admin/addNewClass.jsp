<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Add New Class</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/layouts/css.jsp"></jsp:include>
</head>

<body class="sb-nav-fixed">
	<!-- 	header -->
	<jsp:include page="/WEB-INF/views/admin/layouts/header.jsp"></jsp:include>
	<!-- 	header -->

	<!--Slidebar-->
	<div id="layoutSidenav">
		<!--Slidebar-->
        <jsp:include page="/WEB-INF/views/admin/layouts/slidebar.jsp"></jsp:include>
        <!--Slidebar-->
        
		<!---This is Content-->
        <div id="layoutSidenav_content">
            <div class="container-fluid px-4">
                <div class="row" style="margin-top: 80px;margin-left: 30%; width: 700px;">
                    <div class="card">
                        <div class="card-header bg-header">
                            <h3 class="fs-2">Tạo lớp học mới</h3>
                        </div>
                        <div class="card-body">
                            <form class="row g-3" id="form_createClass" name="form_createClass" action="${base }/addNewClass" method="POST">
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label fs-5">Tên lớp học</label>
                                    <input type="text" id="className" name="className" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label for="courseName" class="form-label fs-5">Khóa học</label>
                                    <select class="form-select" name="courseName" id="courseID" aria-label="Floating label select example">
										<c:forEach items="${courseList }" var="o">
											<option value="${o.courseID }">${o.courseName }</option>
										</c:forEach>
									  </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputAddress" class="form-label fs-5">Học phí</label>
                                    <input type="text" id="tuitionFees" name="tuitionFees" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label for="inputAddress2" class="form-label fs-5">Giảm học phí</label>
                                    <input type="text" id="tuitionFeeSales" name="tuitionFeeSales" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label for="inputAddress" class="form-label fs-5">Ngày bắt đầu</label>
                                    <input type="date" class="form-control" name="startDate" id="startDate" autocomplete="off">
                                </div>
                                <div class="col-md-6">
                                    <label for="teacher" class="form-label fs-5">Giảng viên phụ trách</label>
                                    <select class="form-select" name="teacher" id="teacher" aria-label="Floating label select example">
										<c:forEach items="${teacherList }" var="o">
											<option value="${o.teacherID }" >${o.fullName }</option>
										</c:forEach>
									 </select>
                                  
                                </div>
                                <br>
                                <div class="col-12">
                                    <a class=" btn btn-add btn-secondary"  href="${base }/infoNewClass" onclick="createClass();" role="button">Tạo lớp học</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!--This is Footer-->
    <jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>