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
<title>Course List</title>
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
            <div class="row mt-5">
                <div class="col-xl-5">
                    <div class="card m-l1">
                        <div class="card card-user">
                            <div class="image">
                            </div>
                            <div class="card-body">
                                <div class="author">
                                    <a href="#">
                                        <img class="avatar border-gray" src="Img/person-1.png" alt="...">
                                    </a>
                                </div>
                                <p class="description text-center">
                                    "I am a Adminator <br> I like fish <br>I feel tired
                                </p>
                                <div class="description text-center">
                                    <button type="submit" class="btn btn-secondary btn-round">Thay avatar</button>
                                </div>
                            </div>
                            <div class="card-footer">
                                <hr>
                                <div class="button-container">
                                    <ul class="list-unstyled">
                                        <li class="social-media">
                                            <a class="fab fa-facebook"></a>
                                            <a class="fab fa-twitter"></a>
                                            <a class="fab fa-instagram"></a>
                                            <a class="fab fa-linkedin"></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-7">
                    <div class="card-tasks card m-r1">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Edit Profile</h5>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Ứng dụng (disabled)</label>
                                                <input type="text" class="form-control" disabled="" placeholder="Middle Learning" value="Middle Learning">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Họ và tên</label>
                                                <input type="text" class="form-control" placeholder="Name" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3 pl-1">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Số điện thoại</label>
                                                <input type="email" class="form-control" placeholder="Phone Number">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control" placeholder="Email" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Ngày sinh</label>
                                                <input type="text" class="form-control" placeholder="Date" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3 pl-1">
                                            <div class="form-group">
                                                <label>Giới tính</label>
                                                <br>
                                                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                                                <label class="btn btn-outline-secondary" for="btnradio1">Nam</label>

                                                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                                                <label class="btn btn-outline-secondary" for="btnradio2">Nữ</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Địa chỉ</label>
                                                <input type="text" class="form-control" placeholder="Address">
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label>Mật khẩu</label>
                                                <input type="text" class="form-control" placeholder="Password">
                                            </div>
                                        </div>
                                        <div class="row" style="margin-bottom: 20px;">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>About Me</label>
                                                    <textarea class="form-control textarea"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="update ml-auto mr-auto">
                                                <button type="submit" class="btn btn-secondary btn-round">Cập nhật Profile</button>
                                            </div>
                                        </div>
                                </form>
                                </div>
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