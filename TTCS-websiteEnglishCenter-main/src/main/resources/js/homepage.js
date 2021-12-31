$(function() {

	// // author badge :)
	// var author = '<div style="position: fixed;bottom: 0;right: 20px;background-color: #fff;box-shadow: 0 4px 8px rgba(0,0,0,.05);border-radius: 3px 3px 0 0;font-size: 12px;padding: 5px 10px;">By <a href="https://twitter.com/mhdnauvalazhar">@mhdnauvalazhar</a> &nbsp;&bull;&nbsp; <a href="https://www.buymeacoffee.com/mhdnauvalazhar">Buy me a Coffee</a></div>';
	// $("body").append(author);

	$("input[type='password'][data-eye]").each(function(i) {
		var $this = $(this),
			id = 'eye-password-' + i,
			el = $('#' + id);
			
		$this.wrap($("<div/>", {
			style: 'position:relative',
			id: id
		}));

		$this.css({
			paddingRight: 60
		});
		$this.after($("<div/>", {
			html: '<i class="fas fa-eye"></i>',
			// class: 'btn btn-primary btn-sm',
			id: 'passeye-toggle-'+i,
		}).css({
				position: 'absolute',
				right: 10,
				top: ($this.outerHeight() / 2) - 12,
				padding: '2px 7px',
				fontSize: 12,
				cursor: 'pointer',
		}));

		$this.after($("<input/>", {
			type: 'hidden',
			id: 'passeye-' + i
		}));

		var invalid_feedback = $this.parent().parent().find('.invalid-feedback');

		if(invalid_feedback.length) {
			$this.after(invalid_feedback.clone());
		}

		$this.on("keyup paste", function() {
			$("#passeye-"+i).val($(this).val());
		});
		$("#passeye-toggle-"+i).on("click", function() {
			if($this.hasClass("show")) {
				$this.attr('type', 'password');
				$this.removeClass("show");
				$(this).removeClass("btn-outline-primary");
			}else{
				$this.attr('type', 'text');
				$this.val($("#passeye-"+i).val());				
				$this.addClass("show");
				$(this).addClass("btn-outline-primary");
			}
		});
	});

	$(".my-login-validation").submit(function() {
		var form = $(this);
        if (form[0].checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
		form.addClass('was-validated');
	});
});
$(document).ready(
	function () {
	    var date=$("#datepicker").datepicker({
	        dateFormat: 'dd-mm-yy',
	        changeMonth: true, //Tùy chọn này cho phép người dùng chọn tháng
	        changeYear: true //Tùy chọn này cho phép người dùng lựa chọn từ phạm vi năm
	    }).val();
	}
);

function register(){
	var  fullname=document.getElementById('fullname').value;
	var  birthday =document.getElementById('birthday').value;
	var	 genders = document.getElementsByName('gender');
	var  gender = '';
	for(var i = 0; i < genders.length; i++){
		if(genders[i].checked == true){
			gender = genders[i].value;
		}
	}
	var  phone=document.getElementById('phone').value;
	var  email=document.getElementById('email').value;
	var  address=document.getElementById('address').value;
	var  idCourse=document.getElementById('courseID').value;
	var  question=document.getElementById('question').value;
	var  today= new Date();
	var ngay = ''+today.getDate();
	var thang =''+(today.getMonth()+1);
	var nam = today.getFullYear();
	if(ngay.length < 2){ ngay = '0'+ngay};
	if(thang.length < 2){ thang = '0'+thang};
	var regisdate = nam+'-'+thang+'-'+ngay;
	var data={};
	if (question==''){

		data ={fullName: fullname,
				gender: gender,
				birthday:birthday,
				phone: phone,
				email: email,
				address: address,
				rigisDate: regisdate,
				idCourse: idCourse,
//				idStudent: idStudent
		};
	}else {
		data ={fullName: fullname,
				gender: gender,
				birthday:birthday,
				phone: phone,
				email: email,
				address: address,
				idCourse: idCourse,
				rigisDate: regisdate,
				question: question,
//				idStudent: idStudent
		};
	}
	
	if(fullname != '' && birthday != '' && phone != '' && email != '' && address != ''){
		jQuery.ajax({
				url:"/ajax/signup",
				type:"post",
				contentType:"application/json",
				data:JSON.stringify(data),
				success: function(jsonResult){
					alert("Đăng ký thành công!")
				},
				error: function(jqXhr,textStatus,errorMessage){}
		});
	}else{
		if (fullname == '') {
			$('#fullname').attr('placeholder','Vui lòng nhập họ tên');
		}
		if (birthday == '') {
			$('#birthday').attr('placeholder','Vui lòng chọn ngày sinh');
		}
		if (phone == '') {
			$('#phone').attr('placeholder','Vui lòng nhập số điện thoại');
		}
		if (email == '') {
			$('#email').attr('placeholder','Vui lòng nhập email');
		}
		if (address == '') {
			$('#address').attr('placeholder','Vui lòng nhập địa chỉ');
		}
	}
}
function register(idStudent){
	var  fullname=document.getElementById('fullname').value;
	var  birthday =document.getElementById('birthday').value;
	var	 genders = document.getElementsByName('gender');
	var  gender = '';
	for(var i = 0; i < genders.length; i++){
		if(genders[i].checked == true){
			gender = genders[i].value;
		}
	}
	var  phone=document.getElementById('phone').value;
	var  email=document.getElementById('email').value;
	var  address=document.getElementById('address').value;
	var  idCourse=document.getElementById('courseID').value;
	var  question=document.getElementById('question').value;
	var  today= new Date();
	var ngay = ''+today.getDate();
	var thang =''+(today.getMonth()+1);
	var nam = today.getFullYear();
	if(ngay.length < 2){ ngay = '0'+ngay};
	if(thang.length < 2){ thang = '0'+thang};
	var regisdate = nam+'-'+thang+'-'+ngay;
	var data={};
	if (question==''){

		data ={fullName: fullname,
				gender: gender,
				birthday:birthday,
				phone: phone,
				email: email,
				address: address,
				rigisDate: regisdate,
				idCourse: idCourse,
				idStudent: idStudent
		};
	}else {
		data ={fullName: fullname,
				gender: gender,
				birthday:birthday,
				phone: phone,
				email: email,
				address: address,
				idCourse: idCourse,
				rigisDate: regisdate,
				question: question,
				idStudent: idStudent
		};
	}
	
	if(fullname != '' && birthday != '' && phone != '' && email != '' && address != ''){
		jQuery.ajax({
				url:"/ajax/signup",
				type:"post",
				contentType:"application/json",
				data:JSON.stringify(data),
				success: function(jsonResult){
					alert("Đăng ký thành công!");
					$('body').load('/homepage');
				},
				error: function(jqXhr,textStatus,errorMessage){}
		});
	}else{
		if (fullname == '') {
			$('#fullname').attr('placeholder','Vui lòng nhập họ tên');
		}
		if (birthday == '') {
			$('#birthday').attr('placeholder','Vui lòng chọn ngày sinh');
		}
		if (phone == '') {
			$('#phone').attr('placeholder','Vui lòng nhập số điện thoại');
		}
		if (email == '') {
			$('#email').attr('placeholder','Vui lòng nhập email');
		}
		if (address == '') {
			$('#address').attr('placeholder','Vui lòng nhập địa chỉ');
		}
	}
}
$('#input_file').on('change',function(){
	var file = $(this)[0].files[0];
	console.log(file);
	if (file) {
		let reader = new FileReader();
		reader.onload = function(event){
			$("#imgPreview").attr("src", event.target.result);
		};
		reader.readAsDataURL(file);
	}
});