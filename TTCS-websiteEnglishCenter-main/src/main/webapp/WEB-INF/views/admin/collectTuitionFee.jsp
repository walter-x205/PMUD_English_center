<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Collect Tuition Fee</title>
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
						<div class="col-xl-5">
							<div class="mb-2 d-flex justify-content-between align-items-center">
<!-- 								<div class="position-relative" style="display: flex;"> -->
<!-- 	                               <input class="form-control w-100" placeholder="Search by order#, name..."> -->
<!-- 	                               <button class="btn text-light bg-secondary ms-1" id="btnNavbarSearch"><i class="fas fa-search"></i></button> -->
<!-- 	                           </div> -->
                                <div class="position-relative"> <span class=" search"></span>
                                    <input class="form-control w-75" placeholder="By name or id" style="margin-left: 120%;">
                                </div>
                                <button type="button" class="btn btn-secondary btn-round fs-5 mt-1" style="margin-left: -90px;">Search</button>
                                <h4 class="table-title" style="position: absolute;float: left;">Danh s??ch L???p</h4>
                            </div>
							
							<div class="table-responsive table-scroll tableFixHead">
								<table class="table table-responsive table-borderless">
									<thead>
										<tr class="bg-header ">
											<th scope="col " width="10% ">ID</th>
											<th scope="col " width="15% ">L???p</th>
											<th scope="col " width="40% ">Kh??a h???c</th>
											<th scope="col " width="30% ">H???c ph??</th>
											<th scope="col " class="text-end " width="5% "><span>Edit</span></th>
										</tr>
									</thead>
									<c:forEach items="${cList }" var="o">
										<tbody>
											<tr>
												<th scope="row ">${o.idClass}</th>
												<td name="idClass" value="${o.idClass}">${o.className}</td>
												<td>${o.courseName}</td>
												<td>${o.tuitionFees}</td>
												<td class="d-flex">
													<button type="button" onclick="chooseClassForCollectTuitionFee(${o.idClass})"
													class="btn btn-secondary btn-round">
													<i class="fas fa-address-card"></i>
													</button>
												</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
						<div class="col-md-7 mt-1">
							<div
								class="mb-2 d-flex justify-content-between align-items-center">
							</div>
							<div class="position-relative">


								<h4 class="table-title mr-1">Danh s??ch H???c vi??n</h4>
							</div>
							<div class="table-responsive table-scroll tableFixHead">
								<table class="table table-responsive table-borderless">
									<thead>
										<tr class="bg-header ">
											<th scope="col " width="5% ">ID</th>
											<th scope="col " width="20% ">H??? t??n</th>
											<th scope="col" width="15% ">H???c Ph??</th>
											<th scope="col " width="15% ">???? ????ng</th>
											<th scope="col " width="15% ">C??n thi???u</th>
											<th scope="col " width="25% ">Tr???ng th??i</th>
											<th scope="col " class="text-end " width="5% "><span>Edit</span></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${studentListOfClass }" var="o">
											<tr>
												<th scope="row ">${o.idStudent }</th>
												<td>${o.fullName }</td>
												<td>
													<fmt:setLocale value="vi_VN" scope="session" /> 
													<fmt:formatNumber value="${infoClass.tuitionFees}" type="currency" />
												</td>
												<c:forEach items="${classmemberList }" var="cmemberList">
													<c:if test="${cmemberList.idStudent == o.idStudent }">
														<td>
															<fmt:setLocale value="vi_VN" scope="session" />
															 <fmt:formatNumber value="${cmemberList.paidTuition}" type="currency" />
														</td>
														<td>
															<fmt:setLocale value="vi_VN" scope="session" /> 
															<fmt:formatNumber value="${infoClass.tuitionFees-cmemberList.paidTuition}" type="currency" />
														</td>
														<c:if
															test="${infoClass.tuitionFees == cmemberList.paidTuition}">
															<td>
																<div class="form-control bg-success text-center">Ho??n th??nh</div>
															</td>
														</c:if>
														<c:if
															test="${cmemberList.paidTuition > 0 && cmemberList.paidTuition <infoClass.tuitionFees }">
															<td>
																<div class="form-control bg-warning text-center">C??n thi???u</div>
															</td>
														</c:if>
														<c:if test="${cmemberList.paidTuition == 0}">
															<td>
																<div class="form-control bg-danger text-center">Ch??a n???p</div>
															</td>
														</c:if>
														<td><button type="button" class="btn btn-secondary btn-round" data-bs-toggle="modal" data-bs-target="#edit-tution-${o.idStudent }"> 
															<i class="fas fa-user-edit"></i></button></td>

		                                                <div class="modal fade" id="edit-tution-${o.idStudent }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="edit-tutionLabel" aria-hidden="true">
		                                                    <div class="modal-dialog">
		                                                        <div class="modal-content">
		                                                            <div class="modal-header">
		                                                                <h5 class="modal-title" id="edit-tutionLabel">N???p h???c ph??</h5>
		                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                                                        	
		                                                            </div>
		                                                            <div class="modal-body">
		                                                            	<form action="${base }/payTuitionFee" method="POST">
																			<div class="d-flex mb-2">
																				<span>H???c ph??:</span>
																				<p class="text-danger mb-0 ml-2">
																					<fmt:setLocale value="vi_VN" scope="session" />
																					<fmt:formatNumber value="${infoClass.tuitionFees}"
																						type="currency" />
																				</p>
																			</div>
																			<div class="d-flex mb-2">
																				<span>S??? ti???n c???n n???p:</span>
																				<p class="text-danger mb-0 ml-2">
																					<fmt:setLocale value="vi_VN" scope="session" />
																					<fmt:formatNumber
																						value="${infoClass.tuitionFees-cmemberList.paidTuition}"
																						type="currency" />
																				</p>
																			</div>
																			<div class="d-flex">
																				<label class="form-label">S??? ti???n n???p:</label>
																				<input type="text" id="payTuitionFee-${o.idStudent }" name="payTuitionFee" class="form-control">
																			</div>
																		</form>                                       
		                                                            </div>
		                                                            <div class="modal-footer">
		                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">????ng</button>
		                                                                <button type="button" class="btn btn-primary" id="save_menu_button" onclick="saveTuitonFee(${cmemberList.idClass},'payTuitionFee-${o.idStudent }',${o.idStudent });">L??u</button>
		                                                            </div>
		                                                        </div>
		                                                    </div>
		                                                </div>														
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
			</main>
		</div>
	</div>
	</div>
	<!--This is Footer-->
	<jsp:include page="/WEB-INF/views/admin/layouts/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/layouts/js.jsp"></jsp:include>

</body>

</html>