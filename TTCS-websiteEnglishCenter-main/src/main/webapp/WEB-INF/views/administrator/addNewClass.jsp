<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Anh Ngữ N2T</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- 	header -->
		<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
		<!-- 	header -->
		<!-- 		sidebar -->
		<jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
		<!-- 		sidebar -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<div class="row">
				<!--Grid column-->
				<div class="col-md-12 mb-md-0 mb-5 form_createClass">
					<div class="title_form"> 
						<h2>Tạo Lớp Học Mới</h2>
					</div>
					<hr>
					<form  id="form_createClass" name="form_createClass" action="${base }/addNewClass" method="POST">

						<!--Grid row-->
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="className" class="">Tên Lớp Học</label>
									<input type="text" id="className" name="className" class="form-control">
								</div>
							</div>
							<!--Grid column-->

							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4 btn_select">
									<label for="courseName" class="">Khoá Học</label><br>
									<select name="courseName" id="courseID"  class="form-select form-control">
										<c:forEach items="${courseList }" var="o">
											<option value="${o.courseID }">${o.courseName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<!--Grid column-->
						</div>
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="tuitionFees" class="">Học Phí</label>
									<input type="text" id="tuitionFees" name="tuitionFees" class="form-control">
								</div>
							</div>
							<!--Grid column-->
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="tuitionFeeSales" class="">Giảm Học Phí</label>
									<input type="text" id="tuitionFeeSales" name="tuitionFeeSales" class="form-control">
								</div>
							</div>
							<!--Grid column-->
						</div>
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="startDate" class="">Ngày Bắt Đầu</label>
									<div class="input-append date" id="datepicker"  data-date-format="yyyy-mm-dd">
									  <input class="form-control add-on" size="16" type="text" placeholder="yyyy-mm-dd" name="startDate" id="startDate" autocomplete="off">
									</div>
								</div>
							</div>
							<!--Grid column-->
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="tuitionFeeSales" class="">Giảng viên phụ trách</label>
									<select name="teacher" id="teacher"  class="form-control" >
										<c:forEach items="${teacherList }" var="o">
											<option value="${o.teacherID }" >${o.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<!--Grid column-->
						</div>
						<div class="row w-75 mx-auto my-4">
							<div class="col-12 text-center">	
								<a class="btn btn-primary w-25"  href="${base }/infoNewClass" onclick="createClass();" role="button" >Tạo</a>
							</div>
						</div>
					</form>
					
				</div>
			</div>
		</div>
		<!-- 		footer -->
		<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		<!-- 		footer -->
	</div>
	<!-- ./wrapper -->
</body>
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</html>