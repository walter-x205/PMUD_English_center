<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trung tâm anh ngữ N2T</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<!-- 	header -->
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- 	header -->

	<!-- main -->
	<div class="content">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb py-1">
				<li class="breadcrumb-item"><a href="./homepage.html">Trang
						chủ</a></li>
				<li class="breadcrumb-item active" aria-current="page">Thông
					tin cá nhân</li>
			</ol>
		</nav>
		<hr>
		<div class="p-5">
			<form id="form_infoStudent" name="form_infoStudent"
				action="${base}/infoStudent" method="POST" class="p-3" style="background-color:#F3F3F3;">
				<div class="row m-0">
					<div class="col-md-2 text-center">
						<label>Avatar</label>
						<div class="p-2">
							<img id="imgPreview" src="dist/img/defaultimage.png" class="img-thumbnail" width="200px" height="200px">
						</div>
						<input type="file" name="input_file" id="input_file" accept="image/*" hidden="">
						<label for="input_file" class="form-control border">Thay đổi avatar</label>
						<div>
							<input type="button" id="reset_password" name="reset_password" class="form-control" value="Thay đổi mật khẩu">
						</div>
					</div>
					<div class="col-md-10">
						<!--Grid row-->
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-5">
								<div class="md-form mb-4">
									<label for="fullName" class="">Họ và tên</label>
									<c:if test="${sessionScope.account != null }">
										<input type="text" id="fullname" name="fullname" class="form-control" value="${sessionScope.account.fullname}">
									</c:if>
									<c:if test="${sessionScope.account == null }">
										<input type="text" id="fullname" name="fullname" class="form-control">
									</c:if>
								</div>
							</div>
							<!--Grid column-->
	
							<!--Grid column-->
							<div class="col-md-5">
								<div class="md-form mb-4">
									<label for="birthday" class="">Ngày Sinh</label>
									<div class="input-append date" id="datepicker" data-date-format="yyyy-mm-dd">
										<c:if test="${sessionScope.account != null }">
											<input class="form-control add-on" size="16" value="${sessionScope.account.birthday }" type="text" placeholder="yyyy-mm-dd"
											name="birthday" id="birthday" autocomplete="off">
										</c:if>
										
										<c:if test="${sessionScope.account == null }">
											<input class="form-control add-on" size="16" value="" type="text" placeholder="yyyy-mm-dd"
											name="birthday" id="birthday" autocomplete="off">
										</c:if>
									</div>
								</div>
							</div>
							<!--Grid column-->
							<!--Grid column-->
							<div class="col-md-2">
								<div class="md-form mb-4">
									<label for="gender" class="">Giới tính</label><br>
									<div class="form-check form-check-inline">
										<c:if test="${sessionScope.account != null }">
											<input class="form-check-input py-2" type="radio" name="gender"
											id="male" value="Nam" ${sessionScope.account.gender =="Nam"?"checked":"" }>
										</c:if>
										<c:if test="${sessionScope.account == null }">
											<input class="form-check-input py-2" type="radio" name="gender"
											id="male" value="Nam">
										</c:if>
										<label class="form-check-label" for="gender">Nam</label>
									</div>
									<div class="form-check form-check-inline">
									<c:if test="${sessionScope.account != null }">
											<input class="form-check-input py-2" type="radio" name="gender"
											id="male" value="Nữ" ${sessionScope.account.gender =="Nữ"?"checked":""  }>
										</c:if>
										<c:if test="${sessionScope.account == null }">
											<input class="form-check-input py-2" type="radio" name="gender"
											id="male" value="Nữ">
										</c:if>
										<label class="form-check-label" for="gender">Nữ</label>
									</div>
								</div>
							</div>
							<!--Grid column-->
						</div>
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-5">
								<div class="md-form mb-4">
									<label for="phone" class="">Số điện thoại</label> 
									<c:if test="${sessionScope.account == null }">
										<input type="text"
										id="phone" name="phone" class="form-control"
										value="">
									</c:if>
									<c:if test="${sessionScope.account != null }">
										<input type="text"
										id="phone" name="phone" class="form-control"
										value="${sessionScope.account.phone }">
									</c:if>
								</div>
							</div>
							<!--Grid column-->
							<!--Grid column-->
							<div class="col-md-5">
								<div class="md-form mb-4">
									<label for="email" class="">Email</label>
									<c:if test="${sessionScope.account == null }">
										<input type="text"
										id="email" name="email" class="form-control"
										value="">
									</c:if>
									<c:if test="${sessionScope.account != null }">
										<input type="text"
										id="email" name="email" class="form-control"
										value="${sessionScope.account.email }">
									</c:if>
								</div>
							</div>
							<!--Grid column-->
						</div>
						<div class="row mx-auto">
							<!--Grid column-->
							<div class="col-md-10">
								<div class="md-form mb-4">
									<label for="address" class="">Địa chỉ</label> 
									<c:if test="${sessionScope.account == null }">
										<input type="text"
										id="address" name="address" class="form-control"
										value="">
									</c:if>
									<c:if test="${sessionScope.account != null }">
										<input type="text"
										id="address" name="address" class="form-control"
										value="${sessionScope.account.address }">
									</c:if>
								</div>
							</div>
							<!--Grid column-->
						</div>
					</div>
				</div>
				<div class="row w-75 mx-auto my-4">
					<div class="col-12 text-center">
						<a class="btn btn-primary w-25" href=""
							onclick="updateStudent(${sessionScope.account.idUser});" role="button">Cập nhật</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- main -->

	<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- 	footer -->
</body>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</html>