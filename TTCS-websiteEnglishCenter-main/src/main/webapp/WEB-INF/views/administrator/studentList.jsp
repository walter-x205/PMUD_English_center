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
					<h2>Danh sách học viên</h2>
				</div>
				<hr>
				<div class="d-flex flex-row justify-content-between mt-4">
					<div class="d-flex flex-row">
						<!-- dữ liệu để thực hiện tìm kiếm sản phẩm -->
<!-- 						<input type="hidden" id="page" name="page"> -->
<%-- 						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Tìm kiếm" value="${searchModel.keyword }"> --%>
<!-- 						<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-outline-primary"><i class="fas fa-search fa-fw"></i></button> -->
					</div>
					
					<div>
						<a class="btn btn-primary mb-1" href="${base }/addNewStudent" role="button"><i class="fas fa-plus"></i> Thêm học viên mới</a>
					</div>
				</div>
				<div class="table_list">
					<table class="table table-bordered">
						<thead class="bg-secondary">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Họ Tên</th>
								<th scope="col">Ngày Sinh</th>
								<th scope="col">Giới Tính</th>
								<th scope="col">Địa Chỉ</th>
								<th scope="col">SĐT</th>
								<th scope="col">Email</th>
								<th scope="col"></th>
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
									<td class="d-flex">
										<a class="btn btn-outline-primary btn-sm py-2 form-control w-40" href="${base }/infoStudent?id=${o.idStudent }"><i class="fas fa-edit"></i></a> 
										<button class="btn btn-outline-primary btn-sm py-2 form-control w-40" name="delete_btn" onclick="deleteStudentToStudentList(this,${o.idStudent});" type="button"><i class="fas fa-trash-alt"></i></button>
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