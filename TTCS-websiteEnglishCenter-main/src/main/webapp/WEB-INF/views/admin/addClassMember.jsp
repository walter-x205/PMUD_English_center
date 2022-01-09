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
<title>Add Student To Class Member List</title>
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
			<main>
				<div class="container-fluid px-4">
					<div class="row" style="margin-top: 30px;">
						<div class="col-xl-6" style="height:400px;">
							<div
								class="mb-2 d-flex justify-content-between align-items-center">
								<div class="position-relative " style="margin-left: 180px;">

									<h4 class="table-title mr-1">Danh sách đăng kí học</h4>
								</div>
							</div>
							<div class="table-responsive table-scroll">
								<table class="table table-responsive table-borderless">
									<thead>
										<tr class="bg-header ">
											<th scope="col " width="5% ">ID</th>
											<th scope="col " width="20% ">Họ tên</th>
											<th scope="col " width="20% ">Ngày sinh</th>
											<th scope="col " width="15% ">Giới tính</th>
											<th scope="col " width="15% ">SĐT</th>
											<th scope="col " width="20% ">Ngày đăng kí</th>
											<th scope="col " class="text-end " width="5% "><span>Add</span></th>
										</tr>
									</thead>
									<tbody>
										<c:set var="count" value="0" scope="page" />					
										<c:forEach items="${subscriberList }" var="o">
											<c:set var="count" value="${count + 1}" scope="page"/>
											<tr>
												<c:if test="${o.idStudent == 0 }">
													<th scope="row "></th>
												</c:if>
												<c:if test="${o.idStudent != 0 }">
													<th scope="row ">${o.idStudent }</th>
												</c:if>												
												<td>${o.fullName }</td>
												<td>${o.birthday }</td>
												<td>${o.gender }</td>
												<td>${o.phone }</td>
												<td>${o.rigisDate }</td>
												<td> <button type="button" class="btn btn-secondary btn-round" onclick="addStToClass(this,${o.idStudent });"><i class="fas fa-user-plus"></i></button></td>
											</tr>
										</c:forEach>
									
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-md-6 mt-2" style="height:400px;">
							<div
								class="mb-2 d-flex justify-content-between align-items-center">
							</div>
							<div class="position-relative d-flex">
								<h4 class="table-title ml-1 mt-1">Danh sách Học Viên</h4>
								<input class="form-control w-25 m-l5"
									placeholder="Search by order#, name... ">
								<button type="button" class="btn btn-secondary btn-round ml1">
									<i class="fas fa-search"></i>
								</button>
							</div>

							<div class="table-responsive table-scroll h-50" style="margin-bottom: -40px;">
								<table class="table table-responsive table-borderless" >
									<thead>
										<tr class="bg-header ">
											<th scope="col " width="4% ">ID</th>
											<th scope="col " width="25% ">Họ tên</th>
											<th scope="col " width="15% ">Ngày sinh</th>
											<th scope="col " width="14% ">Giới tính</th>
											<th scope="col " width="15% ">SĐT</th>
											<th scope="col " width="5% ">Add</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${studentListNotInClass }" var="o">
											<tr>
												<th scope="row ">${o.idStudent }</th>
												<td>${o.fullName }</td>
												<td>${o.birthday }</td>
												<td>${o.gender }</td>
												<td>${o.phone }</td>
												<td> <button type="button" class="btn btn-secondary btn-round" onclick="addStToClass(this);"><i class="fas fa-user-plus"></i></button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>

						<div class="row">
							<div class="col-xl-12" style="margin-top: -130px;">
								<div class="table-title fs-3 mt2">Danh sách Lớp</div>

								<div class="table-responsive table-scroll h-100">
									<table class="table table-responsive table-borderless">
										<thead>
											<tr class="bg-header">
												<th scope="col" width="5%">ID</th>
												<th scope="col" width="20%">Họ tên</th>
												<th scope="col" width="15%">Ngày sinh</th>
												<th scope="col" width="15%">Giới tính</th>
												<th scope="col" width="15%">Số điện thoại</th>
												<th scope="col " width="5% ">Action</th>
											</tr>
										</thead>
										<tbody id="tbody_modal_stList"></tbody>
									</table>
								</div>
								
							</div>
						</div>
						<div class="row">
							<a class="btn btn-primary w-25" onclick="saveStListForClass(${infoClass.idClass});" role="button" >Thêm vào lớp</a>
						</div>
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