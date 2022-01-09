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
<title>Pay roll</title>
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
					<div class="row" style="margin-top: 60px;">
						<div class="col-xl-5">
							<div
								class="mb-2 d-flex justify-content-between align-items-center">

								<div class="position-relative">
									<span class=" search"></span> <input class="form-control w-50"
										placeholder="Search by order#, name..."
										style="margin-left: 145%;">
								</div>
								<button type="button"
									class="btn btn-secondary btn-round fs-5 mt-1"
									style="margin-left: -90px;">Search</button>
								<h4 class="table-title" style="position: absolute; float: left;">Chọn
									Giảng Viên</h4>
							</div>

							<div class="table-responsive table-scroll">
								<table class="table table-responsive table-borderless">
									<thead>
										<tr class="bg-header ">
											<th scope="col " width="10% ">ID</th>
											<th scope="col " width="45% ">Tên giảng viên</th>
											<th scope="col " width="35% ">Số điện thoai</th>
											<th scope="col " class="text-end " width="10% "><span>Edit</span></th>
										</tr>
									</thead>
									<c:forEach items="${teacherList }" var="o">
										<tbody>
											<tr>
												<th scope="row ">${o.teacherID}</th>
												<td id="idTeacher" value="${o.teacherID}">${o.fullName}</td>
												<td>${o.phone}</td>
												<td>
													<button type="button" class="btn btn-secondary btn-round" onclick="chooseTeacherForPayroll(${o.teacherID},${getMonth });">
														<i class="fas fa-address-card"></i> 
													</button>
												</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
						<div class="col-md-7 " style="margin-top: -5px;">
							<div
								class="mb-2 d-flex justify-content-between align-items-center">
							</div>
							<div class="position-relative ">
								<div class="row">
									<div class="col-md-6">
										<h4 class="table-title mr-1" style="margin-left: -150px;">Bảng
											Tính Lương</h4>
<%-- 										<c:forEach items="${teacherList }" var="o"> --%>
<%-- 											<c:if test="${chooseIdTeacher==o.teacherID }"> --%>
<%-- 												<p>${o.fullName}</p> --%>
<%-- 											</c:if> --%>
<%-- 										</c:forEach> --%>
									</div>
									<div class="col-md-6 mt-1 d-flex">
										<select class="form-select fs-5 mt-1"
											aria-label="Default select example" id="month">
											<c:forEach  begin="1" end="12" varStatus="loop">
												<option value="${loop.count }" ${(getMonth) == loop.count?"selected":""}>Tháng ${loop.count }/ ${getCurYear } </option>
											</c:forEach>
										</select>
										<button class="btn btn-secondary btn-round fs-5 mt-1" onclick="chooseMonthForPayroll(${chooseIdTeacher});" type="button">Chọn</button>
									</div>
								</div>
							</div>
							<div class="table-responsive table-scroll">
								<table class="table table-responsive table-borderless">
									<thead>
										<tr class="bg-header ">
											<th scope="col " width="10% ">ID</th>
											<th scope="col " width="25% ">Lớp giảng dạy</th>
											<th scope="col " width="20% ">Đơn vị lương</th>
											<th scope="col " width="20% ">Số buổi dạy</th>
											<th scope="col " width="25% ">Lương theo lớp</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${payrollList }" var="o">
											<tr>
												<td>${o.idClass }</td>
												<c:forEach items="${cList }" var="cList">
													<c:if test="${cList.idClass==o.idClass }"><td>${cList.className}</td></c:if>
												</c:forEach>
												<td>${o.salaryUnit }</td>
												<td>${o.numberOfTeaching }</td>
												<td>${o.numberOfTeaching*o.salaryUnit }</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="4">Tổng Lương:</td>
											<td>${totalMoney}</td>
										</tr>
									</tbody>
								</table>
							</div>
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