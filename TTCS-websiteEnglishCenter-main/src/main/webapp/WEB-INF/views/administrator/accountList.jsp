<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
			<div class="form_content">
				<div class="title_form">
					<h2>Danh sách tài khoản</h2>
				</div>
				<hr>
				<div class="d-flex flex-row justify-content-between mt-4">
					<div class="d-flex flex-row">
<!-- 						dữ liệu để thực hiện tìm kiếm sản phẩm -->
<!-- 						<input type="hidden" id="page" name="page"> -->
<%-- 						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Tìm kiếm" value="${searchModel.keyword }"> --%>
<!-- 						<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-outline-primary"><i class="fas fa-search fa-fw"></i></button> -->
					</div>
					<c:if test="${checkStaff==true }">
						<div>
							<a class="btn btn-primary mb-1" href="${base }/addNewAccountStaff" role="button"><i class="fas fa-plus"></i> Thêm tài khoản mới</a>
						</div>
					</c:if>
				</div>
				<div class="table_list">
					<table class="table table-bordered">
						<thead class="bg-secondary">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Tên đăng nhập/email</th>
								<th scope="col">Mật khẩu</th>
								<th scope="col">Số điện thoại</th>
								<c:if test="${staffList != null }">
									<th scope="col">Vị trí</th>
								</c:if>
								<th scope="col">
<%-- 									<c:if test="${checkStaff==true }"> --%>
<!-- 										<div> -->
<%-- 											<a class="btn btn-primary mb-1" href="${base }/addNewAccountStaff" role="button"><i class="fas fa-plus"></i> Thêm tài khoản mới</a> --%>
<!-- 										</div> -->
<%-- 									</c:if> --%>
								</th>
							</tr>
						</thead>
						<c:forEach items="${accountList }" var="a">
							<tbody>
								<tr>
									<th scope="row">${a.idUser }</th>
									<td>${a.username }</td>
									<td>${a.password }</td>
									<c:forEach items="${studentList }" var="o">
										<c:if test="${a.idUser == o.idStudent }">
											<td>${o.phone }</td>
										</c:if>
									</c:forEach>
									<c:forEach items="${teacherList }" var="o">
										<c:if test="${a.idUser == o.teacherID }">
											<td>${o.phone }</td>
										</c:if>
									</c:forEach>
									<c:forEach items="${staffList }" var="o">
										<c:if test="${a.idUser == o.idStaff }">
											<td>${o.phone }</td>
										</c:if>
									</c:forEach>
									<c:forEach items="${sPositionList }" var="s">
											<c:if test="${a.idPosition ==s.idPosition }">
												<td>${s.name }</td>
											</c:if>
										</c:forEach>
									
									
									<td class="d-flex">
<%-- 										<a class="btn btn-outline-primary btn-sm py-2 form-control w-40" href="${base }/infoTeacher?id=${o.teacherID }"><i class="fas fa-edit"></i></a>  --%>
										<button class="btn btn-outline-primary btn-sm py-2 form-control w-40" name="delete_btn" onclick="deleteAccount(this,${a.idAccount});" type="button"><i class="fas fa-trash-alt"></i></button>
									</td>
								</tr>
							</tbody>
						</c:forEach>
						
					</table>
				</div>
			</div>
		</div>
		<!-- /.content-wrapper -->
		<!-- 		footer -->
		<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		<!-- 		footer -->
	</div>
	<!-- ./wrapper -->
</body>
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</html>