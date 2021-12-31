<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${base }/admin" class="brand-link">
      <img src="${base }/dist/img/logon2t.png" alt="AdminLTE Logo" class="brand-image  elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">N2T admin</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${base }/dist/img/anh.jpg" class="img-circle " alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${sessionScope.account.fullname}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
             <a class="nav-link">Quản Lý Tài Khoản</a>
			 <ul class="nav nav-treeview">
	              <li class="nav-item">
	                <a href="${base }/accountList/nhan-vien" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Tài Khoản Nhân Viên</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="${base }/accountList/hoc-vien" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Tài Khoản Học Viên</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="${base }/accountList/giang-vien" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Tài Khoản Giảng Viên</p>
	                </a>
	              </li>
	            </ul>
          </li>
          <li class="nav-item">
             <a href="${base }/teacherList" class="nav-link">Quản Lý Giảng Viên</a>

          </li>
          <li class="nav-item">
             <a href="${base }/studentList" class="nav-link">Quản Lý Học Viên</a>

          </li>
          <li class="nav-item">
            <a href="${base }/courseList" class="nav-link">Quản Lý Khoá Học</a>

         </li>
          <li class="nav-item">
            <a href="${base }/classList" class="nav-link">Quản Lý Lớp Học</a>

          </li>

          <li class="nav-item">
            <a href="" class="nav-link">Quản Lý Tài Chính</a>
              <ul class="nav nav-treeview">
	              <li class="nav-item">
	                <a href="${base }/collectTuitionFees" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Quản Lý Học Phí</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="${base }/payroll" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Quản Lý Lương</p>
	                </a>
	              </li>
	            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
