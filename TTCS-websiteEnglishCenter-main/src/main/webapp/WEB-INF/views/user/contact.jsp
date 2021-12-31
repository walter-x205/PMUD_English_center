<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Homepage</title>
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
			  <li class="breadcrumb-item"><a href="./homepage.html">Trang chủ</a></li>
			  <li class="breadcrumb-item active" aria-current="page">Liên Hệ</li>
			</ol>
		</nav>
		<hr>
		      <!--Section: Contact v.2-->
		<div class="contact_info mt-5 mb-4 mx-5 px-5">
			<ul>
				<li><i class="fas fa-phone-alt"></i><a href="">0987654321</a></li>
				<li><i class="fas fa-envelope"></i><a href="">tangoctue1502@gmail.com</a></li>
				<li><i class="fas fa-map-marker-alt"></i>Hà Nội</li>
			</ul>
			<iframe src="https://www.google.com/maps/embed?pb=!1m19!1m8!1m3!1d29802.5987063512!2d105.790843!3d20.979612!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x3135acd01f4e9f33%3A0xcd54b75e36bbe8f9!2zS2h1IMSRw7QgdGjhu4sgVsSDbiBRdcOhbiwgUC4gVsSDbiBRdcOhbiwgSMOgIMSQw7RuZywgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!3m2!1d20.9778606!2d105.7926086!5e0!3m2!1svi!2sus!4v1631193467607!5m2!1svi!2sus" width="500" height="150" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
		</div>
		<section class="mb-5 mx-5 px-5">

			<!--Section heading-->
			<h2 class="h1-responsive font-weight-bold text-center my-4">Liên Hệ </h2>
			<h4 class="text-success text-center ">${advertise }</h4>
			<!--Section description-->
			<div class="row">
				<!--Grid column-->
				<div class="col-md-12 mb-md-0 mb-5 contact_form">
					<form id="contact-form" name="contact-form" action="${base }/contact" method="POST">

						<!--Grid row-->
						<div class="row">
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="fullname" class="">Họ và tên</label>
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
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="phone" class="">Số điện thoại</label>
									<c:if test="${sessionScope.account != null }">
										<input type="text" id="phone" name="phone" class="form-control" value="${sessionScope.account.phone}">
									</c:if>
									<c:if test="${sessionScope.account == null }">
										<input type="text" id="phone" name="phone" class="form-control">
									</c:if>
								</div>
							</div>
							<!--Grid column-->
							
						</div>
						<!--Grid row-->
						<!--Grid row-->
						<div class="row">
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="email" class="">Email</label>
									<c:if test="${sessionScope.account != null }">
										<input type="text" id="email" name="email" class="form-control" value="${sessionScope.account.email}">
									</c:if>
									<c:if test="${sessionScope.account == null }">
										<input type="text" id="email" name="email" class="form-control">
									</c:if>
								</div>
							</div>
							<!--Grid column-->
							<!--Grid column-->
							<div class="col-md-6">
								<div class="md-form mb-4">
									<label for="address" class="">Địa chỉ</label>
									<c:if test="${sessionScope.account != null }">
										<input type="text" id="address" name="address" class="form-control" value="${sessionScope.account.address}">
									</c:if>
									<c:if test="${sessionScope.account == null }">
										<input type="text" id="address" name="address" class="form-control">
									</c:if>
								</div>
							</div>
							<!--Grid column-->

							
						</div>
						<!--Grid row-->
						<!--Grid row-->
						<div class="row">
							<!--Grid column-->
							<div class="col-md-12">
								<div class="md-form mb-4">
									<label for="message">Nội dung</label>
									<textarea type="text" id="message" name="message" rows="7" class="form-control md-textarea"></textarea>
								</div>
							</div>
						</div>
						<!--Grid row-->

					</form>
					<div class="text-center">
						<a class="btn btn-primary" onclick="document.getElementById('contact-form').submit();" style="color: white;">Gửi</a>
					</div>
				</div>
				<!--Grid column-->

			</div>

		</section>
		<!--Section: Contact v.2-->
	</div>
	<!-- main -->

	<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- 	footer -->
</body>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</html>