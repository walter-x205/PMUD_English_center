<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="content-wrapper px-2 py-4">
			<div class="row m-0">
				<div class="col-md-4">

					<div class="title_form">
						<h2>Chọn Lớp</h2>
					</div>
					<hr>
					<div class="table_list">
						<table class="table table-bordered ">
							<thead class="bg-secondary">
								<tr>
									<th scope="col">Tên lớp</th>
									<th scope="col">Khoá học</th>
								</tr>
							</thead>
							<c:forEach items="${cList }" var="o">
								<tbody>
									<tr>
										<td name="idClass" value="${o.idClass}">${o.className}</td>
										<td class="d-flex">
											<button
												class="btn btn-outline-primary btn-sm py-2 form-control w-40"
												onclick="chooseClassForCollectTuitionFee(${o.idClass})"
												type="button">Chọn</button>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="col-md-8">
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
									<th scope="col">Học Phí</th>
									<th scope="col">Đã Đóng</th>
									<th scope="col">Còn Thiếu</th>
									<th scope="col">Trạng Thái</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${studentListOfClass }" var="o">
									<tr>
										<td >${o.idStudent }</td>
										<td>${o.fullName }</td>
										<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
												value="${infoClass.tuitionFees}" type="currency" /></td>
										<c:forEach items="${classmemberList }" var="cmemberList">
											<c:if test="${cmemberList.idStudent == o.idStudent }">
												<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
														value="${cmemberList.paidTuition}" type="currency" /></td>
												<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
														value="${infoClass.tuitionFees-cmemberList.paidTuition}"
														type="currency" /></td>
												<c:if
													test="${infoClass.tuitionFees == cmemberList.paidTuition}">
													<td><div class="form-control bg-success text-center">Hoàn
															thành</div></td>
												</c:if>
												<c:if
													test="${cmemberList.paidTuition > 0 && cmemberList.paidTuition <infoClass.tuitionFees }">
													<td><div class="form-control bg-warning text-center">Đang
															hoàn thành</div></td>
												</c:if>
												<c:if test="${cmemberList.paidTuition == 0}">
													<td><div class="form-control bg-danger text-center">Chưa
															nộp</div></td>
												</c:if>
												<td>
													<!-- Button trigger modal -->
													<button type="button"
														class="btn btn-outline-primary btn-sm py-2 form-control w-40"
														data-toggle="modal"
														data-target="#exampleModal-${o.idStudent }" >
														<i class="fas fa-edit"></i>
													</button> <!-- Modal -->
													<div class="modal fade" id="exampleModal-${o.idStudent }"
														tabindex="-1" role="dialog"
														aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">Nộp
																		Học Phí</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>

																<div class="modal-body">
																	<form action="${base }/payTuitionFee" method="POST">
																		<div class="d-flex mb-2">
																			<span>Học phí:</span>
																			<p class="text-danger mb-0 ml-2">
																				<fmt:setLocale value="vi_VN" scope="session" />
																				<fmt:formatNumber value="${infoClass.tuitionFees}"
																					type="currency" />
																			</p>
																		</div>
																		<div class="d-flex mb-2">
																			<span>Số tiền cần nộp:</span>
																			<p class="text-danger mb-0 ml-2">
																				<fmt:setLocale value="vi_VN" scope="session" />
																				<fmt:formatNumber
																					value="${infoClass.tuitionFees-cmemberList.paidTuition}"
																					type="currency" />
																			</p>
																		</div>
																		<div class="d-flex">
																			<span>Số tiền nộp:</span>
<!-- 																        	<input type="text" id="payTuitionFees1234" name="payTuitionFees" class="form-control" placeholder="Nhập số tiền nộp" value=""> -->
																			<input type="text" id="payTuitionFee-${o.idStudent }" name="payTuitionFee" class="form-control">
																		</div>
																	</form>
																</div>

																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-primary" id="save_menu_button" onclick="saveTuitonFee(${cmemberList.idClass},'payTuitionFee-${o.idStudent }',${o.idStudent });">Lưu</button>
																	<%-- 												        <button type="button" class="btn btn-primary" onclick="payTuitionFee(${cmemberList.idClass})">Lưu</button> --%>
																</div>
															</div>
														</div>
													</div>
												</td>
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
	<!-- /.content-wrapper -->
	<!-- 		footer -->
	<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
	<!-- 		footer -->
	</div>
	<!-- ./wrapper -->
</body>
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</html>