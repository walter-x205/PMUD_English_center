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
<title>Attendance List</title>
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
			<div class="row mt-5" style="margin-left: 10px">
				<div class="table-title fs-3">
					Điểm danh lớp ${infoClass.className} (Ngày bắt đầu: ${infoClass.startDate })
					<p>
						<button type="submit" class="btn btn-secondary btn-round fz4"
							data-bs-toggle="modal" data-bs-target="#add-rollup">
							<i class="fas fa-calendar-check"></i>Thêm điểm danh
						</button>
					</p>
				</div>
				<!-- Modal -->
				<div class="modal fade ml-9" id="add-rollup" tabindex="0"
					aria-labelledby="add-rollupLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="add-rollupLabel">Danh sách
										điểm danh lớp ${infoClass.className} (Ngày bắt đầu:
										${infoClass.startDate })</h5>
								<br>

							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xl-3">
										<div class="mb-3">
											<label for="disabledTextInput" class="form-label">Khóa
												học</label>
												<c:forEach items="${courseList }" var="o">
													<c:if test="${infoClass.idCourse == o.courseID}">
													<input type="text" id="disabledTextInput"
												class="form-control" placeholder="${o.courseName } " disabled>
														
													</c:if>
												</c:forEach>								 
										</div>
									</div>
									<div class="col-xl-3">
										<label class="form-label">Giảng viên</label>
										 <select class="form-select" name="teaccherName" id="teaccherName">
											<c:forEach items="${teacherList }" var="o">
												<option value="${o.teacherID} "
													${infoClass.idTeacher == o.teacherID?"selected":""}>${o.fullName }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-xl-3">
										<label class="form-label">Ngày</label> 
										<select class="form-select" name="date" id="date">
											<c:forEach items="${lessonList}" var="o">
											   	<option value="${o.date }" ${curDate==o.date?"selected":"" }>${o.date }</option>
											 </c:forEach>
										</select>
									</div>
									<div class="col-xl-3">
										<label class="form-label">Buổi học thứ</label> <input type="text"
											id="nextLesson" class="form-control"
											placeholder="${countLesson+1 }" disabled>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-12">
									<div class="table-responsive table-scroll">
										<table class="table table-responsive table-borderless">
											<thead>
												<tr class="bg-header">
													<th scope="col" width="5%">ID</th>
													<th scope="col" width="20%">Học viên</th>
													<th scope="col" width="10%">Có</th>
													<th scope="col" width="10%">Nghỉ</th>
													<th scope="col" width="50%">Ghi chú</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${studentListOfClass }" var="o">
													<tr>
														<td>${o.idStudent }</td>
														<td><p style="width: 200px;">${o.fullName }</p></td>
														<td id="form_checkin">
															<div class="form-check form-check-inline">
															  <input class="form-check-input radio" type="radio" name="${o.idStudent }" id="present" value="1" checked>
															  <label class="form-check-label" for="roll-up"> Có </label>
															</div>
														</td>
														<td id="form_checkin">
															<div class="form-check form-check-inline">
															  <input class="form-check-input radio" type="radio" name="${o.idStudent }" id="absent" value="0">
															  <label class="form-check-label" for="roll-up"> Không </label>
															 </div>
														</td>
														<td>
															<input type="text" id="note" name="note" class="form-control" placeholder="(*)">
														</td>
													</tr>
												</c:forEach>
												<!-- <tr>
													<th scope="row">1</th>
													<td>Tạ Ngọc Tuệ</td>
													<td>
														<div class="form-check">
															<input class="form-check-input" type="radio" name="yes" id="roll-up" checked>
															<label class="form-check-label" for="roll-up"> Có
													</td>
													<td><input class="form-check-input" type="radio"
														name="no" id="roll-up"> <label class="form-check-label" for="roll-up"> Không</td>
													</div>
													</td>
													<td>(*)</td>
													<td>...</td>
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Hủy</button>
								<button type="button" class="btn btn-primary" onclick="saveAttendanceForClass(${infoClass.idClass});">Lưu</button>
							</div>
						</div>
					</div>
				</div>
				<div class="table-responsive table-scroll m-l5">
					<table class="table table-responsive table-borderless"
						style="width: 1000px; border: 1px solid lightgrey">
						<thead>
							<tr class="bg-header">
								<th scope="col" width="5%">ID</th>
								<th scope="col" width="15%">Học viên</th>
								<c:forEach items="${dateOfSchedules }" var="o">
									<th scope="col" ><span>Buổi ${o.numberOfLesson }</span><br><p style="font-size:12px;margin:0;">Ngày ${o.date }</p></th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${studentListOfClass }" var="o">
								<tr>
									<th scope="row">${o.idStudent }</th>
									<td class="row">${o.fullName }</td>
									<%-- <td style="width: 30px;">${o.idStudent }</td>
									<td><p style="width: 150px;">${o.fullName }</p></td> --%>
									<c:forEach items="${attendanceList  }" var="at">
										<c:if test="${o.idStudent == at.idStudent }">
											<c:if test="${at.isAttendant == 1 }">
												<td>
													<div class="form-check" style="width: 50px;">
													  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked>
													</div>
												</td>
														
											</c:if>
											<c:if test="${at.isAttendant !=1}">
												<td>
													<div class="form-check">
													  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" >
													</div>
												</td>
											</c:if>
										</c:if>
									</c:forEach>	
								</tr>
							</c:forEach>
							
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