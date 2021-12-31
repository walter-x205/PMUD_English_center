<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
     <!-- Navbar Brand-->
     <a class="navbar-brand ps-3 simple-text mx-3" href="test.html"><img src="assets/logo/logo.svg" style="width: 40px; height: 40px"> Middle <sup></sup>
     </a>
     <a href="test.html" class="mr-3 navbar-brand" style="margin-top: -5px; margin-left: -30px;"> Teacher List</a>
     <li class="nav-item dropdown mr-1 mb-4">
         <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i class="far fa-bell i"></i>
  
		  </a>
		         <!--Notification-->
		         <div class="dropdown-menu">
		             <a class="dropdown-item d-flex align-items-start" href="#">
		                 <div class="img" style="background-image: url(images/person_1.jpg);"></div>
		                 <div class="text pl-3">
		                     <h4>Tue<span> add thêm task mới</span></h4>
		                     <span class="time">m min ago</span>
		                 </div>
		             </a>
		             <a class="dropdown-item d-flex align-items-start" href="#">
		                 <div class="img" style="background-image: url();"></div>
		                 <div class="text pl-3">
		                     <h4>Tue <span> update khóa học </span></h4>
		                     <span class="time">m min ago</span>
		                 </div>
		             </a>
		             <a class="dropdown-item d-flex align-items-start" href="#">
		                 <div class="img" style="background-image: url();"></div>
		                 <div class="text pl-3">
		                     <h4>Tue <span> thêm lớp học</span></h4>
		                     <span class="time">m min ago</span>
		                 </div>
		             </a>
		             <a class="dropdown-item text-center btn-link" href="#">
				View All
				<span class="ion-ios-arrow-round-forward"></span>
			</a>
         </div>

     </li>
     <!-- Navbar Search-->
     <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
         <div class="input-group">
             <input class="form-control" type="text" placeholder="Search by Name ..." aria-label="Search" aria-describedby="btnNavbarSearch" />
             <button class="btn text-secondary bg-light" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
         </div>
     </form>
     <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
     <!--User Login-->
     <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
         <li class="nav-item dropdown no-arrow">
             <a class="nav-link " href="Login.html" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 <i class="fas fa-user fa-fw"></i>
                 <span class="mr-2 d-none d-lg-inline text-gray-600 small">Đăng nhập</span>
             </a>
         </li>
     </ul>
 </nav>