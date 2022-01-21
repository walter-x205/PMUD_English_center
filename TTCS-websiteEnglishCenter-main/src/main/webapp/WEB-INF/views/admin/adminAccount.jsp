<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Account Admin</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/layouts/css.jsp"></jsp:include>
</head>

<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/admin/layouts/header.jsp"></jsp:include>


	<div id="layoutSidenav">
		<!--Slidebar-->
		<jsp:include page="/WEB-INF/views/admin/layouts/slidebar.jsp"></jsp:include>
		<!---This is Content-->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="row" style="margin-top: 60px;">
						<div class="mb-2 d-flex justify-content-between align-items-center">
							<div class="position-relative">
								<span class="position-absolute search"><i class="fa fa-search"></i></span> <input class="form-control w-100"
									placeholder="Search by order#, name...">
							</div>
							<c:if test="${sessionScope.admin.role == 'ADMIN' }">
							<div class="px-2">
								<a href="${base }/addNewAccountStaff" type="button" class="btn btn-secondary add-button">
									<i class="fas fa-plus"></i> Thêm tài khoản mới
								</a>
								<i class="fa fa-ellipsis-h ms-3"></i>
							</div>
							</c:if>
						</div>
						<div class="table-responsive table-scroll tableFixHead">
							<table class="table table-responsive table-borderless table-hover">
								<thead>
									<tr class="bg-header">
										<th scope="col" width="8%">ID</th>
										<th scope="col" width="20%">Tên đăng nhập/Email</th>
										<th scope="col" width="15%">Số điện thoại</th>
										<th scope="col" width="20%">Email</th>
										<th scope="col" width="10%">Vị trí</th>
										<c:if test="${sessionScope.admin.role == 'ADMIN'}">
										<th scope="col" class="text-end" width="10%"><span>Action</span></th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adminAccountList }" var="a">
									<tr>
										<th scope="row">${a.idUser}</th>
										<td>${a.username }</td>
										<td>${a.phone }</td>
										<td>${a.email }</td>
										<td>${a.accountType }</td>
										<c:if test="${sessionScope.admin.role == 'ADMIN' }">
										<td class="text-end"><a href="${base}/addNewAccountStaff"><i class="fas fa-edit"></i></a> <a href=""><i class="fas fa-times"></i></a></td>
										</c:if>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<!--This is Footer-->
	<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>