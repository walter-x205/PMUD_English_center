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
<title>Student List</title>
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
						<div
							class="mb-2 d-flex justify-content-between align-items-center">
							<div class="position-relative" style="display: flex;">
                                <input class="form-control w-100" placeholder="Search...">
                                <button class="btn text-light bg-secondary ms-1" id="btnNavbarSearch"><i class="fas fa-search"></i></button>
                            </div>
							<div class="px-2">
								<a type="button" class="btn btn-secondary add-button" href="${base }/addNewStudent"><i class="fas fa-plus"></i>Thêm học viên mới</a> 
								<i class="fa fa-ellipsis-h ms-3"></i>
							</div>
						</div>
						<div class="table-responsive table-scroll tableFixHead">
							<table class="table table-responsive table-borderless">
								<thead>
									<tr class="bg-header">
										<th scope="col" width="5%">ID</th>
										<th scope="col" width="15%">Họ Tên</th>
										<th scope="col" width="12%">Ngày sinh</th>
										<th scope="col" width="12%">Địa chỉ</th>
										<th scope="col" width="10%">Giới tính</th>
										<th scope="col" width="15%">SĐT</th>
										<th scope="col" width="15%">Email</th>
										<th scope="col" class="text-end" width="10%"><span>Action</span></th>
									</tr>
								</thead>
								<c:forEach items="${studentList }" var="o">
									<tbody>
										<tr>
											<th scope="row">${o.idStudent }</th>
											<td>${o.fullName }</td>
											<td>${o.birthday }</td>
											<td>${o.gender }</td>
											<td>${o.address }</td>
											<td>${o.phone }</td>
											<td>${o.email }</td>
											<td class="text-end">
												<a href="${base }/infoStudent?id=${o.idStudent }"><i class="fas fa-edit"></i></a> 
												<a name="delete_btn" onclick="deleteStudentToStudentList(this,${o.idStudent});" role="button"><i class="fas fa-times"></i></a>
											</td>
											<%-- <td class="d-flex">
												<a class="btn btn-outline-primary btn-sm py-2 form-control w-40" href="${base }/infoStudent?id=${o.idStudent }"><i class="fas fa-edit"></i></a> 
												<button class="btn btn-outline-primary btn-sm py-2 form-control w-40" name="delete_btn" onclick="deleteStudentToStudentList(this,${o.idStudent});" type="button"><i class="fas fa-trash-alt"></i></button>
											</td> --%>
										</tr>
									</tbody>
								</c:forEach>
								
							</table>
						</div>
			</main>
		</div>
	</div>
	<!--This is Footer-->
	<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>