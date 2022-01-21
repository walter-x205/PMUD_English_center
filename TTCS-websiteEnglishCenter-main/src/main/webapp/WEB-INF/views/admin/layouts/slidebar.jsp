<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Home</div>
				<a class="nav-link" href="${base }/admin">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> Dashboard
				</a>
				<c:if test="${sessionScope.admin != null }">
					<div class="sb-sidenav-menu-heading">Tác vụ quản lý</div>
					<c:if test="${sessionScope.admin.role == 'ADMIN' or  sessionScope.admin.role == 'STAFF'}">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Quản lý User
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${base }/teacherList">Quản lý Giảng Viên</a> <a class="nav-link" href="${base }/studentList">Quản lý Học Viên</a>
							</nav>
						</div>
					</c:if>
					<c:if test="${sessionScope.admin.role == 'ADMIN' or  sessionScope.admin.role == 'STAFF'}">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Quản lý khóa học
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="${base }/courseList">Danh sách</a> <a class="nav-link" href="${base }/addNewCourse">Thêm khóa học</a>
							</nav>
						</div>
					</c:if>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false"
						aria-controls="pagesCollapseError">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> Quản lý lớp học
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="${base }/classList">Danh sách</a> <a class="nav-link" href="${base }/addNewClass">Thêm lớp học</a>
						</nav>
					</div>
					<c:if test="${sessionScope.admin.role == 'ADMIN' or  sessionScope.admin.role == 'STAFF'}">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false"
							aria-controls="pagesCollapseAuth">
							<div class="sb-nav-link-icon">
								<i class="fas fa-address-book"></i>
							</div> Quản lý tài khoản
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${base }/adminAccount">Tài khoản Nhân Viên</a> <a class="nav-link" href="${base }/teacherAccount">Tài khoản
									Giảng Viên</a> <a class="nav-link" href="${base }/studentAccount">Tài khoản Học Viên</a>
							</nav>
						</div>
					</c:if>
					<a class="nav-link" href="${base }/collectTuitionFee">
						<div class="sb-nav-link-icon">
							<i class="fas fa-money-check-alt"></i>
						</div> Quản lý Học Phí
					</a>
					<a class="nav-link" href="${base }/payroll">
						<div class="sb-nav-link-icon">
							<i class="fas fa-money-bill-alt"></i>
						</div> Quản lý Lương
					</a>
					<div class="sb-sidenav-menu-heading">Biểu đồ</div>
					<a class="nav-link" href="#">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> Biểu đồ
					</a>
				</c:if>
	</nav>
</div>