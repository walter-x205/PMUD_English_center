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
						<h2>Thông Tin Học Viên</h2>
					</div>
					<hr>
					<form  id="form_infoStudent" name="form_infoStudent" action="${base}/infoStudent" method="POST">
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
											<input type="text" id="fullName" name="fullName" class="form-control" value="${st.fullName }">
										</div>
									</div>
									<!--Grid column-->
		
									<!--Grid column-->
									<div class="col-md-5">
										<div class="md-form mb-4">
											<label for="birthday" class="">Ngày Sinh</label>
											<div class="input-append date" id="datepicker"  data-date-format="yyyy-mm-dd">
											  <input class="form-control add-on" size="16" value="${st.birthday }" type="text" placeholder="yyyy-mm-dd" name="birthday" id="birthday" autocomplete="off">
											</div>
										</div>
									</div>
									<!--Grid column-->
									<!--Grid column-->
									<div class="col-md-2">
										<div class="md-form mb-4">
											<label for="gender" class="">Giới tính</label><br>
											<div class="form-check form-check-inline">
											  <input class="form-check-input py-2" type="radio" name="gender" id="male" value="Nam" ${st.gender =="Nam"?"checked":"" }>
											  <label class="form-check-label" for="gender">Nam</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input py-2" type="radio" name="gender" id="female" value="Nữ" ${st.gender == "Nữ"?"checked":"" }>
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
											<input type="text" id="phone" name="phone" class="form-control" value ="${st.phone }">
										</div>
									</div>
									<!--Grid column-->
									<!--Grid column-->
									<div class="col-md-5">
										<div class="md-form mb-4">
											<label for="email" class="">Email</label>
											<input type="text" id="email" name="email" class="form-control" value="${st.email }">
										</div>
									</div>
									<!--Grid column-->
								</div>
								<div class="row mx-auto">
									<!--Grid column-->
									<div class="col-md-10">
										<div class="md-form mb-4">
											<label for="address" class="">Địa chỉ</label>
											<input type="text" id="address" name="address" class="form-control" value="${st.address }">
										</div>
									</div>
									<!--Grid column-->
								</div>
							</div>
						</div>
						<div class="row w-75 mx-auto my-4">
							<div class="col-12 text-center">	
								<a class="btn btn-primary w-25" onclick="updateStudent(${st.idStudent});" role="button" >Lưu</a>
							</div>
						</div>	
					</form>			
				</div>
			</div>
		</div>

					<!-- <div class="form-check">
			          <input type="checkbox" class="form-check-input" id="exampleCheck1">
			          <label class="form-check-label" for="exampleCheck1">Check me out</label>
			        </div> -->
					

		<!-- 		footer -->
		<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		<!-- 		footer -->
	</div>
	<!-- ./wrapper -->
</body>
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</html>