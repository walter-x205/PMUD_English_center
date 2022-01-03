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
<title>Pay roll</title>
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
							<div class="position-relative">
								<span class="position-absolute search"> <i
									class="fa fa-search"></i>
								</span> <input class="form-control w-100"
									placeholder="Search by id,Họ tên...">
							</div>
							<h4 class="table-title mr-1">Danh sách giảng viên</h4>

							<div class="px-2">
								<select class="form-select">
									<option selected>Tháng 1/22</option>
									<option value="1">Tháng 2/22</option>
									<option value="2">Tháng 3/22</option>
									<option value="3">Tháng 4/22</option>
								</select>
							</div>
						</div>
						<div class="table-responsive table-scroll">
							<table class="table table-responsive table-borderless">
								<thead>
									<tr class="bg-header ">
										<th scope="col " width="5% ">ID</th>
										<th scope="col " width="15% ">Họ Tên</th>
										<th scope="col " width="15% ">Lớp đã dạy</th>
										<th scope="col " width="10% ">Số điện thoại</th>
										<th scope="col " width="15% ">Đơn vị lương</th>
										<th scope="col " width="10% ">Số buổi dạy</th>
										<th scope="col " width="15% ">Lương theo lớp</th>
										<th scope="col " class="text-end " width="9% "><span>Xem
												thêm</span></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row ">1</th>
										<td>Tạ Tuệ</td>
										<td>L15</td>
										<td>098238244</td>
										<td>30</td>
										<td>5</td>
										<td>30*5</td>
										<td class="text-end"><button type="button"
												class="btn btn-outline-secondary add-button"
												data-bs-toggle="modal" data-bs-target="#edit-tution">
												<i class="fas fa-info-circle"></i></button>
										</td>
										<div class="modal fade" id="edit-tution"
											data-bs-backdrop="static" data-bs-keyboard="false"
											tabindex="-1" aria-labelledby="edit-tutionLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="edit-tutionLabel">Thông
															tin lương giảng viên</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<p>Học tên:</p>
														<p>Ngày sinh:</p>
														<p>Số điện thoại:</p>
														<p>Email:</p>
														<p>Tổng lương:</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Đóng</button>
														<button type="button" class="btn btn-primary">Lưu</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</tr>

							</tbody>
						</table>
					</div>
			</main>
		</div>
	</div>
	</div>
	<!--This is Footer-->
	<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>