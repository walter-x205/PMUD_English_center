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
<title>Teacher Infor</title>
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
			<form id="form_addNewStudent" name="form_addNewStudent"
				action="${base}/admin/teacher/info" method="POST">
				<div class="row mt-5">
					<div class="col-xl">
						<div class="card-tasks card m-r1">
							<div class="card card-user">
								<div class="card-header">
									<h5 class="card-title">Thông tin giảng viên</h5>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-xl-4">
<!-- 											<div class="card card-user justify-content-center"> -->
<!-- 													<div class="image"></div> -->
<!-- 													<div class="card-body"> -->
<!-- 														<a href="#"> <img class="avatar border-gray" -->
<!-- 																src="Img/person-1.png" alt="..."> -->
<!-- 															</a> -->
<!-- 													</div> -->
<!-- 													<div class="card-footer"> -->
<!-- 														<div class="text-center"> -->
<!-- 															<button type="submit" class="btn btn-secondary btn-round">Thay -->
<!-- 																avatar</button> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
										</div>
										<div class="col-xl-8">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<br> <input type="text" class="form-control"
															disabled="" placeholder="Middle Learning"
															value="Middle Learning">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Họ và tên</label> <input type="text" id="fullName"
															name="fullName" class="form-control"
															value="${teacher.fullName }" placeholder="Họ và tên">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Email</label> <input type="email" id="email"
															name="email" class="form-control"
															value="${teacher.email }" placeholder="Email">
													</div>
												</div>
												<div class="col-md-4 ">
													<div class="form-group">
														<label>Ngày sinh</label> <input type="date"
															class="form-control" value="${teacher.birthday }"
															placeholder="yyyy-mm-dd" name="birthday" id="birthday"
															autocomplete="off">
													</div>
												</div>
												<div class="col-md-2 ">
													<div class="form-group">
														<label>Giới tính</label> <select id="gender"
															class="form-select">
															<option value="Nam"
																${teacher.gender =="Nam"?"selected":"" }>Nam</option>
															<option value="Nữ"
																${teacher.gender == "Nữ"?"selected":"" }>Nữ</option>
														</select>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Địa chỉ</label> <input type="text" id="address"
															name="address" class="form-control"
															value="${teacher.address }">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Số điện thoại</label> <br> <input
															type="number" id="phone" name="phone"
															class="form-control" value="${teacher.phone }"
															placeholder="Phone Number">
													</div>
												</div>

											</div>
											<div class="row">
												<div class="update ml-auto mr-auto  mt-3">
													<button type="button" class="btn btn-secondary btn-round"
														onclick="updateInfoTeacher(${teacher.teacherID})">Cập
														nhật</button>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--This is Footer-->
	<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>