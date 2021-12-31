<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="content">
				<h4 class="modal-title" id="exampleModalLabel">Điểm danh lớp
					${infoClass.className} (Ngày bắt đầu: ${infoClass.startDate })</h4>
				<div class="btnRollCall">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal">
						<i class="fas fa-clipboard-list"></i> Thêm điểm danh
					</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document"
							style="max-width: 1000px; margin-left: 380px">
							<div class="modal-content">
								<div class="modal-header d-block">
									<h5 class="modal-title" id="exampleModalLabel">Danh sách
										điểm danh lớp ${infoClass.className} (Ngày bắt đầu:
										${infoClass.startDate })</h5>
									<br>
									<div class="row m-0 p-0 ">
										<div class="col-md-12 p-0 d-flex">
											<div class="col-md-3 form-control mr-1">
												<c:forEach items="${courseList }" var="o">
													<c:if test="${infoClass.idCourse == o.courseID}">
														<span>Khoá học: </span> ${o.courseName }</c:if>
												</c:forEach>
											</div>
											<div class="col-md-4 d-flex form-control mr-1">
												<span>Giảng viên:</span> <select name="teaccherName" id="teaccherName" style="width: 60%;" class="ml-4">  
													<c:forEach items="${teacherList }" var="o">
														<option value="${o.teacherID} "
															${infoClass.idTeacher == o.teacherID?"selected":""}>${o.fullName }</option>
													</c:forEach>
												</select>
											</div>
<!-- 											<div class="col-md-2  form-control" > -->
<%-- 												Ngày: <span id="curDate">${curDate }</span> --%>
												
												
<!-- 											</div> -->
											<div class="col-md-2  form-control wrapper" style="z-index:5">
													
													<select name="date" id="date" class="w-100" onfocus='this.size=5;' onblur='this.size=1;' onchange='this.size=1; this.blur();'>
													   <c:forEach items="${lessonList}" var="o">
													   	<option value="${o.date }" ${curDate==o.date?"selected":"" }>${o.date }</option>
													   </c:forEach>
													</select>
												</div>
											<div class="col-md-2  form-control"  >
												Buổi học thứ: <span id="nextLesson">${countLesson+1 }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-body">
									<div class="scrolltable"
										style="height: 400px; overflow: scroll">
										<table class="table table-bordered table-striped">
											<thead class="bg-secondary w-100" style="width: 50px;">
												<tr>
													<th scope="col" style="width: 50px;">ID</th>
													<th scope="col" style="width: 150px;">Học Viên</th>
													<th scope="col" style="width: 50px;">Có</th>
													<th scope="col" style="width: 50px;">Nghỉ</th>
													<th scope="col">Ghi chú</th>
												</tr>
											</thead>
											<tbody id="tbody_modal_attList">
												<c:forEach items="${studentListOfClass }" var="o">
													<tr>
														<td>${o.idStudent }</td>
														<td><p style="width: 200px;">${o.fullName }</p></td>
														<td id="form_checkin">
															<div class="form-check form-check-inline">
															  <input class="form-check-input radio" type="radio" name="${o.idStudent }" id="present" value="1" checked>
															</div>
														</td>
														<td id="form_checkin">
															<div class="form-check form-check-inline">
															  <input class="form-check-input radio" type="radio" name="${o.idStudent }" id="absent" value="0">
															 </div>
														</td>
														<td>
															<input type="text" id="note" name="note" class="form-control" placeholder="(*)">
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Huỷ</button>
									<button type="button" class="btn btn-primary" onclick="saveAttendanceForClass(${infoClass.idClass});">Lưu</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="scrolltable"
					style="width: 100%; height: 450px; resize: both; overflow: auto;">
					<table class="table table-bordered table-striped">
						<thead class="bg-secondary">
							<tr>
								<th scope="col" style="width: 30px;">ID</th>
								<th scope="col" style="width: 150px;">Học Viên</th>
								<c:forEach items="${dateOfSchedules }" var="o">
									<th scope="col" ><span>Buổi ${o.numberOfLesson }</span><br><p style="font-size:12px;margin:0;">Ngày ${o.date }</p></th>
								</c:forEach>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${studentListOfClass }" var="o">
								<tr>
									<td style="width: 30px;">${o.idStudent }</td>
									<td><p style="width: 150px;">${o.fullName }</p></td>
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
	<!-- /.content-wrapper -->
	<!-- 		footer -->
	<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
	<!-- 		footer -->
	</div>
	<!-- ./wrapper -->
</body>
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</html>