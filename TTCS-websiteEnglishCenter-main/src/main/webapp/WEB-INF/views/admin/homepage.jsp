<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Homepage</title>
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
			<main class="form-signin">
				<h1 class="h3 mb-3 fw-normal">Sign-in Middle</h1>
				<sf:form action="${base}/ad-login" class="login-form" modelAttribute="admin-login">
					<div class="form-floating mb-3">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="fa fa-user" style="margin-bottom: 10px;"></span>
						</div>
						<sf:input type="text" class="form-control" id="floatingInput" placeholder="Username" required="true" path="username"></sf:input>
					</div>
					<div class="form-floating mb-3">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="fa fa-lock" style="margin-bottom: 10px;"></span>
						</div>
						<sf:input type="password" class="form-control" id="floatingPassword" placeholder="Password" required="true" path="password"></sf:input>
					</div>
					<div class="checkbox mb-3">
						<label class="form-check-label"> <input class="form-check-input" type="checkbox" value="remember-me"> Remember me
						</label>
					</div>
					<button class="w-100 btn btn-lg btn-primary fw-bold" type="submit">Sign in</button>
				</sf:form>
			</main>
		</div>
	</div>
	<!--This is Footer-->
	<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>