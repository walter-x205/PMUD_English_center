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
<title>Course Infor</title>
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
             <div class="container-fluid px-4">
                 <div class="row mt-5" >
                     <div class="card">
                         <div class="card-header bg-header">
                             <h3 class="fs-2">Thông tin khóa học</h3>
                         </div>
                         <div class="card-body">
                             <form class="row g-3" id="form_infoCourse" name="form_infoCourse" action="${base}/infoCourse" method="POST">
                                 <div class="col-md-6">
                                     <label for="courseName" class="form-label fs-5">Tên khóa học mới</label>
                                     <input type="text" id="courseName" name="courseName" class="form-control" placeholder="Tên khoá học" value="${course.courseName }">
                                 </div>
                                 <div class="col-md-6">
                                     <label for="totalLesson" class="form-label fs-5">Thời lượng</label>
                                     <input type="text" id="totalLesson" name="totalLesson" class="form-control" placeholder="Số buổi học" value="${course.totalLesson }">
                                 </div>
                                 <br>
                                 <div class="col-12">
									<div class="form-floating overflow-auto">
<!-- 										<label for="courseName" class="form-label fs-5">Tên khóa học mới</label> -->
										<textarea class="form-control" id="description" name="description" style="height: 350px">${course.description }</textarea>
										<!-- <label for="Detail">Mô tả khóa học</label> -->
									  </div>
                                 </div>
								<a class="btn btn-secondary" onclick="updateInfoCourse(${course.courseID} );" role="button"> Lưu thông tin</a>
                             </form>
                         </div>
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