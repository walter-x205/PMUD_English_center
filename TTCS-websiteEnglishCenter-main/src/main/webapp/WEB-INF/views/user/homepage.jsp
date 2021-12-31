<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Homepage</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<!-- 	header -->
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- 	header -->

	<!-- main -->
	<div class="content">
		<div class="slide_bar">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="../images/slide4.png" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="../images/slide1.jpg" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="../images/slide2.jpg" alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="../images/slide3.jpg" alt="Fourth slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					  <span class="carousel-control-prev-icon" aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
					  <span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					  <span class="carousel-control-next-icon" aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
					 <span class="sr-only">Next</span>
				</a>
			  </div>
		</div>
		<hr>
		<div class="content_section1">
			<h2 class="title">Chào Mừng Bạn Đến Với Trung tâm Anh Ngữ N2T</h2>
			<div class="underline"><hr></div>
			<ul>
				<li>
						<div class="icon"><i class="far fa-badge-check"></i></div>
						<div class="about">Chương trình và phương pháp giảng dạy hiện đai theo tiêu chuẩn quốc tế</div>
				</li>
				<li>
						<div class="icon"><i class="fas fa-award"></i></div>
						<div class="about">Môi trường học cởi mở, thân thiện, cơ sở vật chất hiện đại, khuyến khích phát triển các kỹ năng toàn diện</div>
				</li>
				<li> 
						<div class="icon"><i class="fas fa-table"></i></div>
						<div class="about">Học phí, Thời khoá biểu được sắp xếp, đảm bảo nhu cầu của học viên </div>
				</li>
				<li>
						<div class="icon"><i class="fas fa-user-tie"></i></div>
						<div class="about">Đội ngũ giảng viên tâm huyết, giàu kinh nghiêm, luôn lắng nghe và giải đáp cho học viên</div>
				</li>
			</ul>
		</div> 
		<hr>
		<div class="content_section2">
			<h2 class="title">Lộ trình học tập tinh gọn</h2>
			<div class="underline"><hr></div>
			<ul>
				<li>
					<div class="headline">
						<div class="numberpart">1</div>
						<span>Lấy lại căn bản</span>
					</div>
					<div class="paragraph">
						<p>Nắm được các ngữ pháp cơ bản và phát triển vốn từ vựng, được phát triển kỹ năng Nghe + Đọc hiểu. Bước đầu làm quen với dạng thức, mẹo và tránh bẫy đề thi</p>
					</div>
				</li>
				<li>
					<div class="headline">
						<div class="numberpart">2</div>
						<span>Nâng cao kiến thức</span>
					</div>
					<div class="paragraph">
						<p>Nâng cao vốn từ vựng cũng như kĩ năng giải quyết vấn đề. Tiếp xúc và giải quyết được những dạng bài phức tạp hơn. Ở giai đoạn này, học viên đã có thể vận dụng Tiếng Anh một cách cơ bản</p>
					</div>
				</li>
				<li>
					<div class="headline">
						<div class="numberpart">3</div>
						<span>Chinh phục</span>
					</div>
					<div class="paragraph">
						<p>Tổng hợp lại kiến thức cần nhớ, những bẫy thường xuất hiện và mẹo tránh bẫy. Trong giai đoạn này, học viên được review lại kiến thức và đưa ra lộ trình học riêng phù hợp với khả năng của mình</p>
					</div>
				</li>
			</ul>
		</div>
		<hr>
		<div class="content_section3">
			<h2 class="title">Thông tin các khoá học</h2>
			<div class="underline"><hr></div>
			<ul >
				<li >
					<div class="img"><img src="../images/khoanewbei.png" alt="" width="100%"></div>	
					<div class="info">
						<span>Khoá học</span><br>
						<a href="#">Tiếng anh cho người mới bắt đầu</a><br>
						<p><i class="fas fa-clock"></i>Thời lượng: 30 buổi</p>
					</div>
					<a href="#">Xem chi tiết</a>
				</li>
				<li>
					<div class="img"><img src="../images/khoahoc.png" alt="" width="100%"></div>
					<div class="info">
						<span>Khoá học</span><br>
						<a href="#">Toeic 4 kỹ năng</a><br>
						<p><i class="fas fa-clock"></i>Thời lượng: 48 buổi</p>
					</div>
					<a href="#">Xem chi tiết</a>
				</li>
				<li>
					<div class="img"><img src="../images/khoa500.png" alt="" width="100%"></div>
					<div class="info">
						<span>Khoá học</span><br>
						<a href="#">Toeic 0 - 500+ từ mất gốc  </a><br>
						<p><i class="fas fa-clock"></i>Thời lượng: 28 buổi</p>
					</div>
					<a href="#">Xem chi tiết</a>
				</li>
				<li>
					<div class="img"><img src="../images/khoa450-750png.png" alt="" width="100%"></div>
					<div class="info">
						<span>Khoá học</span><br>
						<a href="#">Toeic 450 - 750+</a><br>
						<p><i class="fas fa-clock"></i>Thời lượng: 20 buổi</p>
					</div>
					<a href="#">Xem chi tiết</a>
				</li>
			</ul>
		</div>
		<hr>
		<div class="content_section4">
			<h2 class="title">Tin tức và sự kiện</h2>
			<div class="underline"><hr></div>
			<div class="row">
				<div class="col-5">
					<h3>Trung Tâm  Anh Ngữ N2T</h3>
				</div>
				<div class="col-7">
					<p>Anh ngữ N2T cập nhật thường xuyên và liên tục những thông tin bên lề kỳ thi TOEIC. Không chỉ đem lại tin tức, đây còn là nguồn tài liệu bổ ích về tiếng Anh đồng thời là nơi cung cấp thông tin về những ưu đãi khủng theo từng khóa học.</p>
				</div>
			</div>
			<ul>
				<li>
					<a href="">
						<img src="../images/thitoeic.jpg" alt="" width="100%">
						<span class="namenews">Cấu Trúc Đề Thi TOEIC : Full 7 Phần Reading & Listening</span>
					</a>
				</li>
				<li>
					<a href="">
						<img src="../images/thitoeic.jpg" alt="" width="100%">
						<span class="namenews">Cấu Trúc Đề Thi TOEIC : Full 7 Phần Reading & Listening</span>
					</a>
				</li>
				<li>
					<a href="">
						<img src="../images/thitoeic.jpg" alt="" width="100%">
						<span class="namenews">Cấu Trúc Đề Thi TOEIC : Full 7 Phần Reading & Listening</span>
					</a>
				</li>
				<li>
					<a href="">
						<img src="../images/thitoeic.jpg" alt="" width="100%">
						<span class="namenews">Cấu Trúc Đề Thi TOEIC : Full 7 Phần Reading & Listening</span>
					</a>
				</li>
				<li>
					<a href="">
						<img src="../images/thitoeic.jpg" alt="" width="100%">
						<span class="namenews">Cấu Trúc Đề Thi TOEIC : Full 7 Phần Reading & Listening</span>
					</a>
				</li>
				<li>
					<a href="">
						<img src="../images/thitoeic.jpg" alt="" width="100%">
						<span class="namenews">Cấu Trúc Đề Thi TOEIC : Full 7 Phần Reading & Listening</span>
					</a>
				</li>
			</ul>
		</div>
		<hr>
		<div class="content_section5">
			<h2 class="title">Chia sẻ của học viên</h2>
			<div class="underline"><hr></div>
			<div class="row">
				<div class="col-3">
					<div class="avatar">
						<img src="../images/tue.jpg" alt="" width="100%">
					</div>
					<div class="feedback">
                           <p>Mình thích nhất ở N2T là HỌC PHÍ RẺ, rất hợp lý cho sinh viên, lộ trình học rõ ràng, phù hợp với đối tượng mất gốc tiếng anh như mình. Cảm ơn trung tâm đã giúp em đạt được những điều mà chính bản thân mình không thể ngờ này </p>               
					</div>
				</div>
				<div class="col-3">
					<div class="avatar">
						<img src="../images/trang.jpg" alt="" width="100%">
					</div>
					<div class="feedback">
                           <p> Mình thích nhất ở N2T là HỌC PHÍ RẺ, rất hợp lý cho sinh viên, lộ trình học rõ ràng, phù hợp với đối tượng mất gốc tiếng anh như mình. Cảm ơn trung tâm đã giúp em đạt được những điều mà chính bản thân mình không thể ngờ này </p>               
					</div>
				</div>
				<div class="col-3">
					<div class="avatar">
						<img src="../images/ngoc.jpg" alt="" width="100%">
					</div>
					<div class="feedback">
                           <p> Mình thích nhất ở N2T là HỌC PHÍ RẺ, rất hợp lý cho sinh viên, lộ trình học rõ ràng, phù hợp với đối tượng mất gốc tiếng anh như mình. Cảm ơn trung tâm đã giúp em đạt được những điều mà chính bản thân mình không thể ngờ này </p>               
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!-- main -->

	<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- 	footer -->
</body>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</html>