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
<title>Class Information</title>
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
		<div id="layoutSidenav_content" style="overflow: auto;">
			<div class="row mt-5" style="margin-left: 10px;">
				<div class="col-xl-6">
					<div class="card-tasks card m-r1">
						<div class="card card-user" style="list-style:none; border: none; height: 300px;">
							<div class="card-header">
								<h5 class="card-title fs-4 fw-bold">Thông tin lớp học</h5>
							</div>
							<div class="card-body">
								<form>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Tên lớp</label>
												<input type="text" id="className" name="className" class="form-control" value="${infoClass.className}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Khóa học</label> 
												<select name="courseName" id="courseName" class="form-select form-control">
													<c:forEach items="${courseList }" var="o">
														<option ${infoClass.idCourse == o.courseID?"selected":"" }>${o.courseName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Tổng số buổi học</label> 
												<c:forEach items="${courseList }" var="o">
													<c:if test="${infoClass.idCourse == o.courseID}">
														<span class="form-control">${o.totalLesson }</span>
													</c:if>		
												</c:forEach>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Ngày bắt đầu</label>
												<input type="text" id="startDate" name="startDate" class="form-control" value="${infoClass.startDate }" placeholder="yyyy-mm-dd">
												 
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Học phí</label>
												<input type="text" id="tuitionFees" name="tuitionFees" class="form-control" value="${infoClass.tuitionFees}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Giảm học phí</label>
												<input type="text" id="tuitionFeeSales" name="tuitionFeeSales" class="form-control" value="${infoClass.tuitionFeeSales }">												
											</div>
										</div>
									</div>
									<div class="row" style="margin-bottom: 20px;">
										<div class="col-md-6">
											<div class="form-group">
												<label>Giảng viên phụ trách</label>
												<select name="teacherName" class="form-control" id="teacherName">
													<c:forEach items="${teacherList }" var="o">
														<option ${infoClass.idTeacher == o.teacherID?"selected":""} >${o.fullName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<br>
												<div class="text-center">
													<button name="saveinfo_btn"  onclick="saveInfoClass(${infoClass.idClass});" type="button" class="btn btn-outline-secondary btn-round">Lưu
														thông tin</button>
												</div>
											</div>
										</div>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-6">
					<div class="row mt--1">
						<div class="col-md-3">
							<div class="form-group">
								<label>Thời gian</label>
								<input type="text" id="times" name="times" class="form-control" placeholder="hh:mm - hh:mm">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Buổi học</label> 
								<select class="form-select" name="weeksday" id="weeksday">
									<c:forEach items="${weeksdayList }" var="o">
										<option >${o.weeksday }</option>
									</c:forEach>												
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Phòng học</label>
								<select class="form-control" name="classroom" id="classroom">
									<c:forEach items="${clrList }" var="o">
										<option >${o.classroomName }</option>
									</c:forEach>
								</select>								
							</div>
						</div>
						<div class="col-md-3">
							<br>
							<button type="submit" class="btn btn-secondary btn-round" onclick="addNewSchedule(${infoClass.idClass},${maxScheduleID});">Thêm
								Lịch</button>
						</div>
					</div>
					<div class="table-responsive scroll-clean tableFixHead">
						<table class="table table-responsive table-borderless" id="scheduleTable">
							<thead>
								<tr class="bg-header">
									<th scope="col" width="30%">Thời gian</th>
									<th scope="col" width="30%">Buổi học</th>
									<th scope="col" width="30%">Phòng học</th>
									<th scope="col" class="text-end" width="10%"><span>Action</span></th>
								</tr>
							</thead>
							<tbody id="body_table">
								<c:forEach items="${schedulesList }" var="o">
									<tr>
										<td>${o.times }</td>
										<td>${o.weeksday }</td>
										<td>${o.classroomName }</td>
										<td class="text-end">
											<button class="btn btn-secondary btn-round" style="font-size: 12px;" name="delete_btn" value="${o.idSchedule }" onclick="deleteSchedule(this)" type="button">Xóa</button>
										</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-xl-12" style="position: relative;margin-top: -40px;">
					<div class="table-title fs-3">
						Danh sách lớp
						<div class="text-right">
							<button type="button" class="btn btn-secondary btn-round" style="font-size: 12px;" onclick="checkAttendance(${checkExistSchedule},${infoClass.idClass},'${infoClass.className}')">
								<i class="fas fa-calendar-check"></i> Điểm danh
							</button>
							<a href="${base }/addClassMember/${infoClass.idClass}" class="btn btn-primary btn-round" style="font-size: 12px;" >
								<i class="fas fa-user-plus" ></i> Thêm sinh viên
							</a>
						</div>

					</div>

					<div class="table-responsive table-scroll tableFixHead">
						<table class="table table-responsive table-borderless">
							<thead>
								<tr class="bg-header">
									<th scope="col" width="5%">ID</th>
									<th scope="col" width="20%">Họ tên</th>
									<th scope="col" width="10%">Ngày sinh</th>
									<th scope="col" width="10%">Giới tính</th>
									<th scope="col" width="15%">Địa chỉ</th>
									<th scope="col" width="10%">Số điện thoại</th>
									<th scope="col" width="20%">Email</th>
									<th scope="col" class="text-end" width="5%"><span>Action</span></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${studentListOfClass }" var="o">
									<tr>
										<td>${o.idStudent }</td>
										<td>${o.fullName }</td>
										<td>${o.birthday }</td>
										<td>${o.gender }</td>
										<td>${o.address }</td>
										<td>${o.phone }</td>
										<td>${o.email }</td>
										<td class="text-end">
											<button class="btn btn-secondary btn-round" style="font-size: 12px;" name="delete_btn" value="${o.idStudent }" onclick="deleteStudentToStudentListOfClass(this,${infoClass.idClass});" type="button">Xóa</button>
										</td>
										<%-- <td>
											<a class="btn btn-outline-primary btn-sm py-2 form-control" href="${base }/deleteStudentToStudentList?id=${infoClass.idClass}" name="delete_btn" value="${o.idStudent }" onclick="deleteStudentToStudentListOfClass(this,${infoClass.idClass});" type="button">Xoá</a>
											<button class="btn btn-outline-primary btn-sm py-2 form-control" name="delete_btn" value="${o.idStudent }" onclick="deleteStudentToStudentListOfClass(this,${infoClass.idClass});" type="button">Xoá</button>
										</td> --%>
									</tr>
								</c:forEach>
								<!-- <tr>
									<th scope="row">1</th>
									<td>Tạ Ngọc Tuệ</td>
									<td>2000-12-15</td>
									<td>Nam</td>
									<td>Thái Bình</td>
									<td>022222222</td>
									<td>tatue@</td>
									<td class="text-end">
										<button type="submit" class="btn btn-secondary btn-round"
											style="font-size: 12px;">Xóa</button>
									</td>
								</tr> -->
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--This is Footer-->
	<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>