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
		<div class="content-wrapper px-2 py-4" >	
			<div class="row m-0">
				<div class="col-md-4" id="left_content">
					
					<div class="row m-0">
						<div class="col-md-12">
							<div class="title_form" style="height:45px">
								<h4>Chọn giảng viên</h4>
							</div>
							
							<div class="table_list" style="height: 350px; overflow: scroll">
								<table class="table table-bordered ">
									<thead class="bg-secondary">
										<tr>
											<th scope="col">Tên giảng viên</th>
											<th scope="col">Số điện thoại</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<c:forEach items="${teacherList }" var="o">
										<tbody>
											<tr>
												<td id="idTeacher" value="${o.teacherID}">${o.fullName}</td>
												<td>${o.phone}</td>
												<td class="d-flex"> 		
<!-- 													<button class="btn btn-outline-primary btn-sm py-2 form-control" onclick="chooseTeacherForPayroll(this);" type="button">Chọn</button>	 -->
													<button class="btn btn-outline-primary btn-sm py-2 form-control" onclick="chooseTeacherForPayroll(${o.teacherID},${getMonth });" type="button">Chọn</button>	
												</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<div class="col-md-12">
<%-- 							<div>${chooseIdTeacher}</div> --%>
							<c:forEach items="${teacherList }" var="o">
								<c:if test="${chooseIdTeacher==o.teacherID }">
									<div class="title_form" style="height:35px">
										<h4>Thông tin giảng viên</h4>
									</div>
									<div class="row m-0">
										<div class="col-md-6"><span>Họ Tên: </span><p>${o.fullName}</p>	</div>
										<div class="col-md-6"><span>Ngày Sinh: </span><p>${o.birthday}</p>	</div>
									</div>
									<div class="row m-0">
										<div class="col-md-6"><span>SĐT: </span><p>${o.phone}</p>	</div>
										<div class="col-md-6"><span>Email: </span><p>${o.email}</p>	</div>
									</div>
								</c:if>
								
							</c:forEach>
						</div>
					</div>
					
				</div>
				<div class="col-md-8">
					<div class="title_form d-flex" style="height:45px">
						<h4>Bảng Tính lương</h4>
						<select id="month" class="form-control ml-4 w-auto p-0">
							<c:forEach  begin="1" end="12" varStatus="loop">
								<option value="${loop.count }" ${(getMonth) == loop.count?"selected":""}>Tháng ${loop.count }/ ${getCurYear } </option>
							</c:forEach>
						</select>
						<button class="btn btn-outline-primary btn-sm py-2 form-control w-25" onclick="chooseMonthForPayroll(${chooseIdTeacher});" type="button">Chọn</button>
					</div>
					
					<div class="table_list">
					<table class="table table-bordered">
						<thead class="bg-secondary">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Lớp giảng dạy</th>
								<th scope="col">Đơn vị lương</th>
								<th scope="col">Số buổi dạy</th>
								<th scope="col">Lương theo lớp</th>
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
<!-- 									<td> -->
<%-- 										<button class="btn btn-outline-primary btn-sm py-2 form-control" name="delete_btn" value="${o.idStudent }" onclick="deleteStudentToStudentListOfClass(this,${infoClass.idClass});" type="button">Xoá</button> --%>
<!-- 									</td> -->
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