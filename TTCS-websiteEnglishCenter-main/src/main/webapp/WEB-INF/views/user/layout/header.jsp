<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<div class="header">
		<div class="row">
			<div class="col-8 header_left">
				<div class="logo_web">
					<img src="../images/logon2t.png" width="100%">
				</div>
				<div class="name_web">
					<span>Trung Tâm Anh Ngữ N2T</span>
				</div>
			</div>
			<div class="col-4 header_right">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Tìm kiếm..." aria-label="Recipient's username" aria-describedby="basic-addon2">
					<div class="input-group-append">
					  <span class="input-group-text" id="basic-addon2"><i class="fas fa-search"></i></span>
					</div>
				</div>
				<div >
					
				</div>
				<div>
					<c:if test="${sessionScope.account != null }">
						<div class="dropdown show">
						  <a class="btn dropdown-toggle d-flex align-items-center bg-light" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
						    <img src="../images/logon2t.png" class="rounded-circle mr-2" width="30px" height="30px">
						  	${sessionScope.account.fullname}
						  </a>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						  	<c:if test="${sessionScope.account.isStaff == 1}">
						  		<a class="dropdown-item" href="${base }/admin">Quản lý hệ thống</a>
						  	</c:if>
						  	<c:if test="${sessionScope.account.isStudent ==1}">
						  		<a class="dropdown-item" href="${base }/personalpage">Thông tin cá nhân</a>
						  		<a class="dropdown-item" href="#">Kết quả học tập</a>
						  	</c:if>
						  	<c:if test="${sessionScope.account.isTeacher ==1}">
						  		<a class="dropdown-item" href="${base }/personalpage">Thông tin cá nhân</a>
						  		<a class="dropdown-item" href="${base }/teachingClass">Quản lý lớp giảng dạy</a>
						  		<a class="dropdown-item" href="#">Quản lý giáo trình</a>
						  	</c:if>
						    <a class="dropdown-item" href="${base }/logout">Đăng xuất</a>
						  </div>
						</div>
					</c:if>
					<c:if test="${sessionScope.account == null }">
						<ul class="formlogin_register">
							<li><a href="${base }/signup">Đăng ký học</a></li>
							<li><a href="${base }/login">Đăng nhập</a></li>
						</ul>
					</c:if>
				</div>
			</div>
			
		</div>
	</div>
	<div class="navigation">
		<ul>
			<li><a href="${base }/homepage"><i class="fas fa-home"></i>Trang chủ</a></li>
			<li>
				<a href="#">Giới thiệu</a>
				<div class="sub_menu">
					<ul>
						<li><a href="">Giới Thiệu Chung</a></li>
						<li><a href="">Đội Ngũ Giảng Viên</a></li>
					</ul>
				</div>
			</li>
			<li>
				<a href="#">Khoá học</a>
				<div class="sub_menu">
					<ul>
						<c:forEach items="${courseList }" var="o">
								<li><a href="${base }/course/${o.courseID}">${o.courseName }</a></li>
						</c:forEach>
					</ul>
				</div>
			</li>
			<li>
				<a href="#">Học viên</a>
				<div class="sub_menu">
					<ul>
						<li><a href="#">Cảm nhận học viên</a></li>
						<c:if test="${sessionScope.account != null }">
							<li><a href="${base }/login">Kết quả học tập</a></li>
							<li><a href="${base }/login">Đăng ký học</a></li>
						</c:if>	
						<c:if test="${sessionScope.account == null }">
							<li><a href="${base }/signup" role="button">Đăng ký học</a></li>
						</c:if>
						
					</ul>
				</div>
			</li>
			<li><a href="#">Tin tức</a></li>
			<li><a href="${base }/contact">Liên hệ</a></li>
		</ul>
	</div>