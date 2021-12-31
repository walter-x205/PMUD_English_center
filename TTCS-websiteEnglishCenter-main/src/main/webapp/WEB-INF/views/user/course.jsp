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
	<title>Khoá Học ${infoCourse.courseName }</title>
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
			  <li class="breadcrumb-item"><a href="${base }/homepage">Trang chủ</a></li>
			  <li class="breadcrumb-item"><a href="">${infoCourse.courseName }</a></li>
			</ol>
		</nav>
		<hr>
		<div class="row">
			<div class="col-3 border-right">
				<div class="sidebar_menu">
					<span><a href="">Khoá Học</a></span>
					<hr>
					<ul>
						<c:forEach items="${courseList}" var="o">
							<li>
								<c:if test="${o.courseID ==infoCourse.courseID}">
									<a href="${base }/course/${o.courseID}" style="color:red;text-decoration:none;">${o.courseName } </a>
								</c:if>
								<c:if test="${o.courseID !=infoCourse.courseID}">
									<a href="${base }/course/${o.courseID}" style="color:black;text-decoration:none;">${o.courseName } </a>
								</c:if>
							</li>
							
							
						</c:forEach>
					</ul>

				</div>
			</div>
			<div class="col-9 p-3">
				<div class="main_content">
					<div class="title_content d-flex justify-content-between align-items-center">
						<p class="m-0">${infoCourse.courseName } - Thời lượng: ${infoCourse.totalLesson } buổi</p>
						<a href="${base }/signup" role="button" class="btn btn-danger form-control" style="width:150px">Đăng ký học</a>
					</div>
					<hr>
					<p class="wrap_text">${infoCourse.description } </p>
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