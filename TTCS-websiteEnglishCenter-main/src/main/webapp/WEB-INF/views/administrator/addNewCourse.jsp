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
						<h2>Nhập Thông Tin Khoá Học Mới</h2>
					</div>
					<hr>
					<form  id="form_addNewCourse" name="form_addNewCourse" action="${base}/addNewCourse" method="POST">

						<!--Grid row-->
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="courseName" class="">Tên khoá học mới</label>
									<input type="text" id="courseName" name="courseName" class="form-control">
								</div>
							</div>
							<!--Grid column-->
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="totalLesson" class="">Thời lượng</label>
									<input type="text" id="totalLesson" name="totalLesson" class="form-control" placeholder="Số buổi học*">
								</div>
							</div>
							<!--Grid column-->
						</div>
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-12">
								<div class="md-form mb-4">
									<label for="fullName" class="">Mô tả về khoá học mới</label>
									<textarea type="text" class="form-control" id="description" name="description"></textarea>
									
								</div>
							</div>
							<!--Grid column-->

						</div>
						<div class="row w-75 mx-auto my-4">
							<div class="col-12 text-center">	
								<a class="btn btn-primary w-25"  href="" onclick="addNewCourse();" role="button" >Thêm</a>
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