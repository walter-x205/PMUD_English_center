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
<title>Teacher Edit</title>
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
							<h3>Nhập thông tin giảng viên</h3>
						</div>
						<div class="card-body">
							<form class="row g-3" id="form_addNewStudent" name="form_addNewStudent" action="${base}/addNewStudent" method="POST">
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label fs-5">Họ và
										tên</label> <input type="text" id="fullName" name="fullName" class="form-control">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label fs-5">Ngày
										sinh</label> <input type="date" class="form-control"
										placeholder="yyyy-mm-dd" name="birthday" id="birthday" autocomplete="off">
								</div>
								<div class="col-6">
									<label for="inputAddress" class="form-label fs-5">Email</label>
									<input type="email" class="form-control" id="email" name="email">
								</div>
								<div class="col-6">
									<label for="inputAddress" class="form-label fs-5">Số
										điện thoại</label> <input type="number" class="form-control"
										id="phone" name="phone">
								</div>
								<div class="col-md-8">
									<label for="inputAddress2" class="form-label fs-5">Địa
										chỉ</label> <input type="text" class="form-control" id="address" name="address">
								</div>
								<div class="col-md-4">
									<label for="inputState" class="form-label fs-5">Giới tính</label>
									
									<select id="gender" class="form-select">
										<option selected  value="Nam">Nam</option>
										<option value="Nữ">Nữ</option>
									</select>
								</div>
								<div class="col-12">
									<label for="floatingTextarea2" class="mb-2 fs-5">Trình
										độ chuyên môn</label>
									<textarea class="form-control" id="qualification" name="qualification"
										style="height: 100px"></textarea>
								</div>
							
								<div class="col-12">
									<a class=" btn btn-add btn-secondary" onclick="addNewTeacher();" role="button" >Thêm giảng viên</a>
									
								</div>
							</form>
						</div>
					</div>

					</main>
				</div>
			</div>
		</div>
		<!--This is Footer-->
		<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>
</body>

</html>