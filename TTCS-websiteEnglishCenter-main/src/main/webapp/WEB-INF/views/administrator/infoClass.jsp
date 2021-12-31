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
						<td><span>Tên Lớp</span></td>
						<td><input type="text" id="className" name="className" class="form-control" value="${infoClass.className}"></td>
					</tr>
					<tr>
						<td><span>Khoá Học</span></td>
						<td>
							<select name="courseName" id="courseName" class="form-select form-control">
								<c:forEach items="${courseList }" var="o">
									<option ${infoClass.idCourse == o.courseID?"selected":"" }>${o.courseName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td><span>Tổng số buổi học</span></td>
						<td>
							<c:forEach items="${courseList }" var="o">
								<c:if test="${infoClass.idCourse == o.courseID}">
									<span class="form-control">${o.totalLesson }</span>
								</c:if>		
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td><span>Ngày Bắt Đầu</span></td>
						<td><input type="text" id="startDate" name="startDate" class="form-control" value="${infoClass.startDate }" placeholder="yyyy-mm-dd"></td>
					</tr>
					<tr>
						<td><span>Học Phí</span></td>
						<td><input type="text" id="tuitionFees" name="tuitionFees" class="form-control" value="${infoClass.tuitionFees}"></td>
					</tr>
					<tr>
						<td><span>Giảm học Phí</span></td>
						<td><input type="text" id="tuitionFeeSales" name="tuitionFeeSales" class="form-control" value="${infoClass.tuitionFeeSales }"></td>
					</tr>
					<tr>
						<td><span>Giảng viên phụ trách</span></td>
						<td>
							<select name="teacherName" class="form-control" id="teacherName">
								<c:forEach items="${teacherList }" var="o">
									<option ${infoClass.idTeacher == o.teacherID?"selected":""} >${o.fullName }</option>
								</c:forEach>
							</select>
						</td>
							
					</tr>
				</table>
			</div>
			<div class="row m-0">			
				<div class="col-md-12 mb-5 p-0">
					<form name="form_schedule" id="form_schedule" class="section" method="POST" action="${base }/createSchedule">
						<fieldset class="border px-3">
							<legend class="w-auto" >Lịch học lớp ${infoClass.className}</legend>
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
											<th scope="col"class="btn_items">
												<a class="btn btn-success btn-sm py-2 form-control"  href="${base }/infoClass?id=${infoClass.idClass}" onclick="addSchedule(${infoClass.idClass},${maxScheduleID})" role="button" ><i class="far fa-calendar-plus"></i> Thêm lịch</a>
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
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody id="body_table">
										<c:forEach items="${schedulesList }" var="o">
											<tr>
												<td>${o.times }</td>
												<td>${o.weeksday }</td>
												<td>${o.classroomName }</td>
												<td><button class="btn btn-outline-primary btn-sm py-2 form-control" name="delete_btn" value="${o.idSchedule }" onclick="deleteSchedule(this)" type="button">xoá</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</fieldset>					
					</form>
				</div>						
			</div>
			<div class="form_content">
				<div class="title_form">
					<h2>Danh sách lớp</h2>
				</div>
				<hr>
				<div class="row justify-content-end">
<%-- 					<a href="${base }/attendanceList?id=${infoClass.idClass}" type="button" class="btn btn-primary" onclick="checkAttendance(${idScheduleOfClass},${infoClass.idClass})"> --%>
<!-- 						  <i class="fas fa-clipboard-list"></i> Điểm danh -->
<!-- 						</a> -->
					<button type="button" class="btn btn-primary" onclick="checkAttendance(${checkExistSchedule},${infoClass.idClass},'${infoClass.className}')">
						  <i class="fas fa-clipboard-list"></i> Điểm danh
						</button>
					<div class="btnAdd">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-success" data-toggle="modal" data-target=".bd-example-modal-lg">
						  <i class="fas fa-user-plus"></i> Thêm Sinh Viên
						</button>
						<!-- Modal -->
						<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg" role="document" style="max-width:1250px;margin-left:250px">
						    <div class="modal-content">
						    	<form name="addStudentToClass" id="addStudentToClass"  method="POST" action="${base}/addStudentToClass">
							      <div class="modal-body">
							        <div class="row">
										<div class="col-md-6">
											<div class="row m-0 p-0">
												<div class="col-md-12">
													<h3>Danh sách đăng ký học</h3>
													<table class="table table-bordered">
														<thead class="bg-secondary">
															<tr>
																<th scope="col">ID</th>
																<th scope="col">Họ Tên</th>
																<th scope="col">Ngày Sinh</th>
																<th scope="col">Giới Tính</th>
																<th scope="col">SĐT</th>
																<th scope="col">Ngày Đăng ký</th>
																<th scope="col"></th>
															</tr>
														</thead>
														<tbody>
															<c:set var="count" value="0" scope="page" />
 

															
															<c:forEach items="${subscriberList }" var="o">
																<c:set var="count" value="${count + 1}" scope="page"/>
																<tr>
	<%-- 																<c:if test="${o.idStudent !=0 }"> <td>${o.idStudent }</td></c:if> --%>
	<%-- 																<c:if test="${o.idStudent ==0 }"> <td>Chưa có</td></c:if> --%>
<%-- 																	<td>${o.idStudent }</td> --%>
																	<c:if test="${o.idStudent == 0 }">
																		<td></td>
																	</c:if>
																	<c:if test="${o.idStudent != 0 }">
																		<td>${o.idStudent }</td>
																	</c:if>
																	
																	<td>${o.fullName }</td>
																	<td>${o.birthday }</td>
																	<td>${o.gender }</td>
																	<td>${o.phone }</td>
																	<td>${o.rigisDate }</td>
																	<td> <button type="button" class="btn btn-primary" onclick="addStToClass(this,${o.idStudent });"><i class="fas fa-plus"></i></button></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>	
												</div>
											</div>
											<div class="row m-0 p-0">
												<div class="col-md-12">
													<h3>Danh sách học viên</h3>
													<table class="table table-bordered">
														<thead class="bg-secondary">
															<tr>
																<th scope="col">ID</th>
																<th scope="col">Họ Tên</th>
																<th scope="col">Ngày Sinh</th>
																<th scope="col">Giới Tính</th>
																<th scope="col">SĐT</th>
																<th scope="col"></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${studentListNotInClass }" var="o">
																<tr>
																	<td>${o.idStudent }</td>
																	<td>${o.fullName }</td>
																	<td>${o.birthday }</td>
																	<td>${o.gender }</td>
																	<td>${o.phone }</td>
																	<td> <button type="button" class="btn btn-primary" onclick="addStToClass(this);"><i class="fas fa-plus"></i></button></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>	
												</div>
											</div>
											
										</div>
										<div class="col-md-6">
											<h3>Danh sách lớp</h3>
											<table class="table table-bordered">
												<thead class="bg-secondary">
													<tr>
														<th scope="col">ID</th>
														<th scope="col">Họ Tên</th>
														<th scope="col">Ngày Sinh</th>
														<th scope="col">Giới Tính</th>
														<th scope="col">SĐT</th>
														<th scope="col"></th>
													</tr>
												</thead>
												<tbody id="tbody_modal_stList"></tbody>
											</table>	
										</div>
									</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Huỷ</button>
							        <a class="btn btn-primary w-25"  href="${base }/infoClass?id=${infoClass.idClass}" onclick="saveStListForClass(${infoClass.idClass})" role="button" >Thêm vào lớp</a>
							      </div>
							    </form>	
						    </div>
						  </div>
						</div>
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
									<td>
<%-- 										<a class="btn btn-outline-primary btn-sm py-2 form-control" href="${base }/deleteStudentToStudentList?id=${infoClass.idClass}" name="delete_btn" value="${o.idStudent }" onclick="deleteStudentToStudentListOfClass(this,${infoClass.idClass});" type="button">Xoá</a> --%>
										<button class="btn btn-outline-primary btn-sm py-2 form-control" name="delete_btn" value="${o.idStudent }" onclick="deleteStudentToStudentListOfClass(this,${infoClass.idClass});" type="button">Xoá</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row m-0 justify-content-center">
				<div class="col-md-3 mx-5">
					<button class="btn btn-outline-primary btn-sm py-2 form-control" name="saveinfo_btn"  onclick="saveInfoClass(${infoClass.idClass});" type="button">Lưu thông tin</button>
<!-- 					<a class="btn btn-outline-primary btn-sm py-2 form-control" href=""  role="button" >Lưu thông tin</a> -->
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