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
<title>Dashboard</title>
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
			<main>
				<div class="container-fluid px-4">
					<div class="row" style="margin-top: 60px;">
						<div class="col-xl-3 col-md-6">
							<div class="card card-stats">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center icon-warning">
												<i class="fas fa-chalkboard-teacher text-warning"></i>
											</div>
										</div>
										<div class="col-7">
											<div class="numbers">
												<p class="card-category">Giảng Viên</p>
												<h4 class="card-title">N Giảng viên</h4>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<hr>
									<div class="stats">
										<a href="#"><i class="fas fa-redo"></i> Update Now </a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card card-stats">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center icon-warning">
												<i class="fas fa-user-graduate text-success"></i>
											</div>
										</div>
										<div class="col-7">
											<div class="numbers">
												<p class="card-category">Sinh Viên</p>
												<h4 class="card-title">N Sinh viên</h4>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<hr>
									<div class="stats">
										<a href="#"><i class="fas fa-redo"></i> Update Now </a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card card-stats">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center icon-warning">
												<i class="fas fa-book-open text-primary"></i>
											</div>
										</div>
										<div class="col-7">
											<div class="numbers">
												<p class="card-category">Khóa Học</p>
												<h4 class="card-title">N Khóa học</h4>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<hr>
									<div class="stats">
										<a href="#"><i class="fas fa-redo"></i> Update Now </a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card card-stats">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center icon-warning">
												<i class="fas fa-briefcase text-danger"></i>
											</div>
										</div>
										<div class="col-7">
											<div class="numbers">
												<p class="card-category">Lớp học</p>
												<h4 class="card-title">N Lớp học</h4>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<hr>
									<div class="stats">
										<a href="#"> <i class="far fa-calendar-alt"></i> Time To
											Class
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!--Chart-->
				<div class="row">
					<div class="col-xl-12">
						<div class="card m-l1">
							<div class="card-header">
								<h5>
									<i class="fas fa-chart-area"></i> Chart
								</h5>
							</div>
							<div class="card-body">Đây là phần của biểu đồ, có thể về
								số lượt truy cập,...</div>
							<div class="card-footer">
								<hr>
								<div class="stats">
									<i class="now-ui-icons loader_refresh spin"> Updated 1
										minute ago </i>
								</div>
							</div>
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