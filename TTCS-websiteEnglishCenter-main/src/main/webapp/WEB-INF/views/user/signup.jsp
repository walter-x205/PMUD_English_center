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
	<title>Đăng Ký Học</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<!-- 	header -->
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- 	header -->
	<!-- main -->
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-12 register">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<h3 class="register-heading">Đăng ký để nhận tư vấn</h3>
						<c:if test="${check == true }">
							<p class="register-message text-success">${message }</p>
						</c:if>
						<c:if test="${check == false }">
							<p class="register-message text-danger">${message }</p>
						</c:if>
						<div class="register-form">
							<form   action="${base }/signup" id="form_signup" name="form_signup" method="POST">
								<div class="row ">
									<div class="col-md-12">		
										<div class="form-group">
											<select id="courseID" class="form-select form-control">
											<c:forEach items="${courseList }" var="o">
												<option  value="${o.courseID }">${o.courseName }</option>
											</c:forEach>
											</select>
										</div>							
										<div class="form-group input-group">
											<div class="input-group-prepend">
											  <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
											</div>
											<c:if test="${sessionScope.account != null }">
												<input type="text" class="form-control" placeholder="Họ và tên *" id="fullname" name="fullname" value="${sessionScope.account.fullname}" />
											</c:if>
											<c:if test="${sessionScope.account == null }">
												<input type="text" class="form-control" placeholder="Họ và tên *" id="fullname" name="fullname" value="" />
											</c:if>
											
										</div>
										<div class="form-group">
											<div class="maxl d-flex ">
												<c:if test="${sessionScope.account != null }">
													<label class="radio inline form-control m-0"> 
														<input type="radio" name="gender" id="male" value="Nam" ${sessionScope.account.gender =="Nam"?"checked":"" }>
														<span> Nam </span> 
													</label>
													<label class="radio inline form-control m-0"> 
														<input type="radio" name="gender" id="female" value="Nữ" ${sessionScope.account.gender =="Nữ"?"checked":"" }>
														<span>Nữ </span> 
													</label>
												</c:if>
												<c:if test="${sessionScope.account == null }">
													<label class="radio inline form-control m-0"> 
														<input type="radio" name="gender" value="Nam" checked>
														<span> Nam </span> 
													</label>
													<label class="radio inline form-control m-0"> 
														<input type="radio" name="gender" value="Nữ">
														<span>Nữ </span> 
													</label>
												</c:if>
												
											</div>
										</div>
										
										<div class="form-group ">
											<div class="input-append date input-group" id="datepicker"  data-date-format="yyyy-mm-dd">
												<div class="input-group-prepend">
												  <span class="input-group-text" id="basic-addon1"><i class="far fa-calendar-alt"></i></span>
												</div>
												<c:if test="${sessionScope.account != null }">
													<input type="text" class="form-control add-on" placeholder="Ngày sinh (yyyy-MM-dd)*" value="${sessionScope.account.birthday}" name="birthday" id="birthday" autocomplete="off"/>
												</c:if>
												<c:if test="${sessionScope.account == null }">
													<input type="text" class="form-control add-on" placeholder="Ngày sinh (yyyy-MM-dd)*" value="" name="birthday" id="birthday" autocomplete="off"/>
												</c:if>
												
											</div>
										</div>
										<div class="form-group input-group">
											<div class="input-group-prepend">
											  <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
											</div>
											<c:if test="${sessionScope.account != null }">
												<input type="email" class="form-control" placeholder="Email *" id="email" name="email" value="${sessionScope.account.email}" />
											</c:if>
											<c:if test="${sessionScope.account == null }">
												<input type="email" class="form-control" placeholder="Email *" id="email" name="email" value="" />
											</c:if>
											
										</div>
										<div class="form-group input-group">
											<div class="input-group-prepend">
											  <span class="input-group-text" id="basic-addon1"><i class="fas fa-phone-alt"></i></span>
											</div>
											<c:if test="${sessionScope.account != null }">
												<input type="text" minlength="10" maxlength="10" name="phone" id="phone" class="form-control" placeholder="Số điện thoại *" value="${sessionScope.account.phone}" />
											</c:if>
											<c:if test="${sessionScope.account == null }">
												<input type="text" minlength="10" maxlength="10" name="phone" id="phone" class="form-control" placeholder="Số điện thoại *" value="" />
											</c:if>
											
										</div>
										<div class="form-group input-group">
											<div class="input-group-prepend">
											  <span class="input-group-text" id="basic-addon1"><i class="fas fa-map-marker-alt"></i></span>
											</div>
											<c:if test="${sessionScope.account != null }">
												<input type="text" class="form-control" placeholder="Địa chỉ *" id="address" name="address" value="${sessionScope.account.address}" />
											</c:if>
											<c:if test="${sessionScope.account == null }">
												<input type="text" class="form-control" placeholder="Địa chỉ *" id="address" name="address" value="" />
											</c:if>
											
										</div>
										<div class="form-group input-group">
											<textarea class="form-control" id="question" name="question" rows="5" placeholder="Câu hỏi về khoá học?"></textarea>
											
										</div>
										
										
<!-- 										<div class="form-group"> -->
<!-- 											<input type="text" class="form-control" placeholder="Tên đăng nhập *" id="username" name="username" value="" /> -->
<!-- 										</div> -->
<!-- 										<div class="form-group"> -->
<!-- 											<input type="password" class="form-control" placeholder="Mật Khẩu *" id="password" name="password" value="" /> -->
<!-- 										</div> -->
<!-- 										<div class="form-group"> -->
<!-- 											<input type="password" class="form-control" id="re_password" name="re_password" placeholder="Nhập lại mật khẩu *" value="" /> -->
<!-- 										</div> -->
										
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<c:if test="${sessionScope.account != null}">
											<button type="button" class="btn btn-success btnRegister_right" onclick="register(${sessionScope.account.idUser});">Đăng ký</button>
										</c:if>
										<c:if test="${sessionScope.account == null}">
											<button type="button" class="btn btn-success btnRegister_right" onclick="register();">Đăng ký</button>
										</c:if>
<%-- 										<button type="button" class="btn btn-success btnRegister_right" onclick="register(${sessionScope.account.idUser});">Đăng ký</button> --%>
										<a href="${base }/homepage"><input type="button" class="btn-secondary btnRegister_left"  value="Huỷ"></a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main -->
	<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- 	footer -->
</body>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</html>