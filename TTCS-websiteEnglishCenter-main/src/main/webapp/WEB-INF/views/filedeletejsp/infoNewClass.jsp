<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
			<h2>Thông tin lớp học</h2>
			<div class="information">
				<table class="table-bordered mb-5">
					<tr>
						
					</tr>
					<tr>
						<td><span>Tên Lớp</span></td>
						<td><input type="text" id="className" name="className" class="form-control" value="${infoClass.className}"></td>
					</tr>
					<tr>
						<td><span>Khoá Học</span></td>
						<td><input type="text" id="courseName" name="courseName" class="form-control" value="${infoClass.courseName }"></td>
					</tr>
					<tr>
						<td><span>Ngày Bắt Đầu</span></td>
						<td><input type="text" id="startDate" name="startDate" class="form-control" value="${infoClass.startDate }"></td>
					</tr>
					<tr>
						<td><span>Học Phí</span></td>
						<td><input type="text" id="tuitionFees" name="tuitionFees" class="form-control" value="${infoClass.tuitionFees}đ"></td>
					</tr>
					<tr>
						<td><span>Giảm học Phí</span></td>
						<td><input type="text" id="tuitionFees" name="tuitionFees" class="form-control" value="${infoClass.tuitionFeeSales }đ"></td>
					</tr>
				</table>
			</div>
			<div class="row m-0">			
				<div class="col-md-12 mb-5 p-0">
					<form name="form_schedule" id="form_schedule" class="section" method="POST" action="${base }/createSchedule">
						<fieldset class="border px-3">
							<legend class="w-auto" >Lịch học ${infoClass.className}</legend>
							<div class="table_list">
								<table class="table table-bordered">
									<thead >
										<tr>
											<th scope="col">
												<span>Thời gian</span>
												<input type="text" id="times" name="times" class="form-control" placeholder="hh:mm - hh:mm">
											
											</th>
											<th scope="col">
												<span>Buổi học</span>
												<select class="form-control" name="weeksday" id="weeksday">
													<c:forEach items="${weeksdayList }" var="o">
														<option >${o.weeksday }</option>
													</c:forEach>												
												</select>
											</th>	
											<th scope="col">
												<span>Phòng học</span>
												<select class="form-control" name="classroom" id="classroom">
													<c:forEach items="${clrList }" var="o">
														<option >${o.classroomName }</option>
													</c:forEach>
												</select>
											</th>
											<th scope="col">
												<span>Giảng viên dạy học</span>
												<select name="teacherName" class="form-control" id="teacherName">
													<c:forEach items="${teacherList }" var="o">
														<option >${o.fullName }</option>
													</c:forEach>
												</select>
											</th>
											<th scope="col"class="btn_items">
												<!-- <a class="btn btn-outline-primary btn-sm py-2 form-control" href="" onclick="addSchedule()" role="button" >Thêm</a> -->
												<button class="btn btn-outline-primary btn-sm py-2 form-control" onclick="addSchedule()" type="button">Lưu</button>
											</th>
										</tr>											
									</thead>
								</table>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col">Thời gian</th>
											<th scope="col">Buổi học</th>
											<th scope="col">Phòng học</th>
											<th scope="col">Giảng viên</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody id="body_table"></tbody>
								</table>
							</div>
						</fieldset>					
					</form>
				</div>						
			</div>
			<div class="form_content">
				<div class="title_form">
					<h2>Danh sách học viên</h2>
				</div>
				<hr>
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
						<c:forEach items="${studentListOfClass }" var="o">
							<tbody>
								<tr>
									<th scope="row">${o.idStudent }</th>
									<td>${o.fullName }</td>
									<td>${o.birthday }</td>
									<td>${o.gender }</td>
									<td>${o.address }</td>
									<td>${o.phone }</td>
									<td>${o.email }</td>
									<td>
										<a class="btn btn-outline-primary btn-sm py-2 form-control" href="${base }/deleteStudentOfClass?id=${infoClass.idClass}&id2=${o.idStudent }" role="button" >Xoá</a>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="row m-0 justify-content-center">
				<div class="col-md-3 mx-5">
					<a class="btn btn-outline-primary btn-sm py-2 form-control" href=""  role="button" >Thêm Sinh Viên</a>
				</div>
				<div class="col-md-3 mx-5">
					<a class="btn btn-outline-primary btn-sm py-2 form-control" href=""  role="button" >Lưu thông tin</a>
				</div>
			</div>
		</div>

		<!-- 		footer -->
		<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		<!-- 		footer -->
	</div>
	<!-- ./wrapper -->
</body>
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</html>