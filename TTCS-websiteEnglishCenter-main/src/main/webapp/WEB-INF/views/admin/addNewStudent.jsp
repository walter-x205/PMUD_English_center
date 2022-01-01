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
<title>Student Edit</title>
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
				<div class="row"
					style="margin-top: 80px; margin-left: 30%; width: 700px;">
					<div class="card">
						<div class="card-header bg-header">
							<h3>Nhập thông tin học viên</h3>
						</div>
						<div class="card-body">
							<form class="row g-3">
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label fs-5">Họ và
										tên</label> <input type="email" class="form-control" id="inputEmail4">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label fs-5">Ngày
										sinh</label> <input type="date" class="form-control"
										id="inputPassword4">
								</div>
								<div class="col-6">
									<label for="inputAddress" class="form-label fs-5">Email</label>
									<input type="number" class="form-control" id="inputAddress">
								</div>
								<div class="col-6">
									<label for="inputAddress" class="form-label fs-5">Số
										điện thoại</label> <input type="number" class="form-control"
										id="inputAddress">
								</div>
								<div class="col-md-8">
									<label for="inputAddress2" class="form-label fs-5">Địa
										chỉ</label> <input type="text" class="form-control" id="inputAddress2">
								</div>
								<div class="col-md-4">
									<label for="inputState" class="form-label fs-5">Giới
										tính</label> <select id="inputState" class="form-select">
										<option selected>Nam</option>
										<option>Nữ</option>
									</select>
								</div>
								<div class="col-12">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="gridCheck">
										<label class="form-check-label" for="gridCheck"> Check
											me out </label>
									</div>
								</div>
								<div class="col-12">
									<button type="submit" class=" btn btn-add btn-secondary">Thêm
										học viên</button>
								</div>
							</form>
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