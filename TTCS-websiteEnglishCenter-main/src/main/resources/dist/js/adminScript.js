
$(document).ready(function() {
    $('#description').summernote({
      placeholder: 'Enter content....',
      tabsize: 2,
      height: 200,
      minHeight: 100,
      maxHeight: 300,
      focus: true,
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']],
      ],
      popover: {
        image: [
          ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
          ['float', ['floatLeft', 'floatRight', 'floatNone']],
          ['remove', ['removeMedia']]
        ],
        link: [
          ['link', ['linkDialogShow', 'unlink']]
        ],
        table: [
          ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
          ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
        ],
        air: [
          ['color', ['color']],
          ['font', ['bold', 'underline', 'clear']],
          ['para', ['ul', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture']]
        ]
      },
      codemirror: {
        theme: 'monokai'
      }
    });
  
});


$('.table tbody tr td').click(function (event) {
    if (event.target.type !== 'radio') {
        $(':radio', this).trigger('click');
    }
});
$(document).ready(function () {
	$('#dtHorizontalVerticalExample').DataTable({
	"scrollX": true,
	"scrollY": 200,
});
$('.dataTables_length').addClass('bs-select');
});

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

 $(document).ready(
	function () {
	    var date=$("#datepicker").datepicker({
	        dateFormat: 'dd-mm-yy',
	        changeMonth: true, //T??y ch???n n??y cho ph??p ng?????i d??ng ch???n th??ng
	        changeYear: true //T??y ch???n n??y cho ph??p ng?????i d??ng l???a ch???n t??? ph???m vi n??m
	    }).val();
	}
);
$(document).ready(
	function () {
		var curDate = new Date();
      
	    // Ng??y hi???n t???i
	    var curDay = curDate.getDate();
	 
	    // Th??ng hi???n t???i
	    var curMonth = curDate.getMonth() + 1;
	      
	    // N??m hi???n t???i
	    var curYear = curDate.getFullYear();
	 
	    // G??n v??o th??? HTML
	    document.getElementById('current_time').innerHTML = curDay + "/" + curMonth + "/" + curYear;
	}
);
function createClass(){
	var className = document.getElementById('className').value;
	var idCourse = document.getElementById('courseID').value;
	var tuitionFees = document.getElementById('tuitionFees').value;
	var tuitionFeeSales = document.getElementById('tuitionFeeSales').value;
	var date = document.getElementById('startDate').value;
	var startDate = new Date(date);
	var idTeacher = document.getElementById('teacher').value;
	let infoClass = {className: className,idCourse: idCourse,tuitionFees: tuitionFees,tuitionFeeSales: tuitionFeeSales,startDate: startDate,idTeacher:idTeacher};
	jQuery.ajax({
		url:"/addNewClass",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(infoClass),
		success: function(jsonResult){
			alert("Th??m l???p th??nh c??ng!");
			$('body').load('/classList');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}

//js t???o lich m???i
var scheduleList =[];
function addNewSchedule(idclass,maxIdSchedule){
	var times = document.getElementById("times").value;
	var weeksday = document.getElementById("weeksday").value;
	var classroomName = document.getElementById("classroom").value;
	var schedule ={times: times, weeksday: weeksday, classroomName: classroomName,idClass: idclass};
	scheduleList.push(schedule);
	//alert(times+"#"+weeksday+"#"+classroomName+" # "+idSchedule+" # "+scheduleList.length);
	showSchedule(maxIdSchedule);
	jQuery.ajax({
		url:"/addSchedule",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(schedule),
		success: function(jsonResult){
			alert("Th??m l???ch h???c th??nh c??ng!");
			$('body').load('/infoClass/'+idclass);
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
	
}
function showSchedule(maxIdSchedule){

	//id table
	var table = document.getElementById("scheduleTable");
	
	for(var i =0; i< scheduleList.length; i++){
		var schedule = scheduleList[i];
		
		var row = table.insertRow();
		
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		
		cell1.innerHTML = schedule.times;
		cell2.innerHTML = schedule.weeksday;
		cell3.innerHTML = schedule.classroomName;
		cell4.innerHTML = '<button class="btn btn-secondary btn-round" style="font-size: 12px;" name="delete_btn"  onclick="deleteSchedule(this)" type="button">X??a</button>';
	}
	scheduleList =[];
}
//js t???o lich m???i
/*function addSchedule(idclass,idSchedule){
	var times = document.getElementById("times").value;
	var weeksday = document.getElementById("weeksday").value;
	var classroomName = document.getElementById("classroom").value;
	var teacherName = document.getElementById("teacherName").value;
	var idClass =idclass;
	var idSchedule=idSchedule;
	let schedule={times: times, weeksday: weeksday, classroomName: classroomName, teacherName: teacherName,idClass: idclass};
	jQuery.ajax({
		url:"/addSchedule",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(schedule),
		success: function(jsonResult){
			alert("Th??m l???ch h???c th??nh c??ng!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}*/
/*function deleteSchedule(x,maxIdSchedule){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var idSchedule = maxIdSchedule + 1;
	var data={idSchedule: idSchedule};
	jQuery.ajax({
		url:"/deleteSchedule",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? l???ch h???c!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}*/
function deleteSchedule(x){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var idSchedule = x.value;
	var data={idSchedule: idSchedule};
	jQuery.ajax({
		url:"/deleteSchedule",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? l???ch h???c!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
//function rollCall(){
//	var th= '<th scope="col" id="th_checkin" style="width:150px">Bu???i 2 Ng??y 11/10</th>';
//	var td= '<td id="form_checkin"><div class="form-check " style="font-size:15px;"><input class="form-check-input " type="checkbox" value="" id="defaultCheck1" ></div></td>';
//	document.getElementById("th_checkin").insertAdjacentHTML("beforebegin", th);
//	document.getElementById("form_checkin").insertAdjacentHTML("beforebegin", td);
//
//}
function addStToClass(x,idStudent){
	var tr = x.parentElement.parentElement;
	var td = tr.children;
	var idStudent = td[0].innerHTML;
	var fullname= td[1].innerHTML;
	var birthday = td[2].innerHTML;
	var gender = td[3].innerHTML;
	var phoneNumber = td[4].innerHTML;
	let trElement = document.createElement("tr");
	let tdElement1 =document.createElement("td");
	tdElement1.innerHTML=idStudent;
	let tdElement2 =document.createElement("td");
	tdElement2.innerHTML=fullname;
	let tdElement3 =document.createElement("td");
	tdElement3.innerHTML=birthday;
	let tdElement4 =document.createElement("td");
	tdElement4.innerHTML=gender;
	let tdElement5 =document.createElement("td");
	tdElement5.innerHTML=phoneNumber;
	let tdElement6 =document.createElement("td");
	let btn_tdElement6 =document.createElement("button");
	btn_tdElement6.innerHTML="Xo??";
	btn_tdElement6.className ="btn btn-outline-primary btn-sm py-2 form-control";
	btn_tdElement6.setAttribute("onclick","xoa(this)");
	trElement.appendChild(tdElement1);
	trElement.appendChild(tdElement2);
	trElement.appendChild(tdElement3);
	trElement.appendChild(tdElement4);
	trElement.appendChild(tdElement5);
	tdElement6.appendChild(btn_tdElement6);
	trElement.appendChild(tdElement6);
	let tBody = document.getElementById("tbody_modal_stList");
	tBody.appendChild(trElement);
}
function xoa(x){
	var tr = x.parentElement.parentElement;
	tr.remove();
}
function deleteStudentToStudentListOfClass(x,idClass){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var idStudent = x.value
	var data={idStudent: idStudent,idClass:idClass};
	jQuery.ajax({
		url:"/deleteStudentToStudentList",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? h???c vi??n ra kh???i l???p!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
function deleteClass(x,idClass){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var data={idClass:idClass};
	jQuery.ajax({
		url:"/deleteClass",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? l???p!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
function saveStListForClass(idclass){
	var studentsOfClass = document.getElementById("tbody_modal_stList");
	var tr = studentsOfClass.children;
	var stList= [];
	for(var i =0;i<tr.length;i++){
		var td =tr[i].getElementsByTagName("td");
		var id =td[0].innerHTML;
		var phone =td[4].innerHTML;
		if(id ==''){
			id=0;
//			alert("1:"+id+" "+idclass+" "+phone);
			var student={idClass: idclass, phone: phone};
		}else{
//			alert("2:"+id+" "+idclass+" "+phone);
			var student={idStudent: id, idClass: idclass, phone: phone};
		}
		stList.push(student);
	}
	jQuery.ajax({
		url:"/addClassMember",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(stList),
		success: function(jsonResult){
			alert("Th??m th??nh c??ng!");
			$('body').load('/infoClass/'+idclass);
		},
		error: function(jqXhr,textStatus,errorMessage){
			alert("l???i"+jqXHR.responseText);
		}
	});
}
function saveInfoClass(idClass){
	var className = document.getElementById('className').value;
	var courseName = document.getElementById('courseName').value;
	var tuitionFees = document.getElementById('tuitionFees').value;
	var tuitionFeeSales = document.getElementById('tuitionFeeSales').value;
	var date = document.getElementById('startDate').value;
	var startDate = new Date(date);
	let infoClass = {className: className,courseName: courseName,tuitionFees: tuitionFees,tuitionFeeSales: tuitionFeeSales,startDate: startDate,idClass:idClass};
	jQuery.ajax({
		url:"/infoNewClass",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(infoClass),
		success: function(jsonResult){
			alert("???? l??u th??ng tin ch???nh s???a!")
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}

function addNewStudent(){
	var  fullName=document.getElementById('fullName').value;
	var  date=document.getElementById('birthday').value;
	var  birthday = new Date(date);
	var	 gender = document.getElementById('gender').value;
	var  phone=document.getElementById('phone').value;
	var  email=document.getElementById('email').value;
	var  address=document.getElementById('address').value;
	var data ={fullName: fullName,birthday: birthday,gender: gender,phone: phone,email: email,address: address};
	/*alert(fullName+" "+birthday+" "+gender+" "+address+" "+phone+" "+email+" ");*/
	jQuery.ajax({
		url:"/addNewStudent",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("Th??m h???c vi??n th??nh c??ng!");
			$('body').load('/studentList');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}

function updateStudent(idStudent){
	var  fullName=document.getElementById('fullName').value;
	var  date=document.getElementById('birthday').value;
	var  birthday = new Date(date);
	var	 gender = document.getElementById('gender').value;
	var  phone=document.getElementById('phone').value;
	var  email=document.getElementById('email').value;
	var  address=document.getElementById('address').value;
	var data ={fullName: fullName,birthday: birthday,gender: gender,phone: phone,email: email,address: address,idStudent:idStudent};
	jQuery.ajax({
		url:"/infoStudent",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("L??u th??ng tin th??nh c??ng!");
			$('body').load('/studentList');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
//function addClassMember(idClass){
//	alert(idClass);
//	$('body').load('/addClassMember?id='+idClass);
//	jQuery.ajax({
//		url:"/addClassMember",
//		type:"post",
//		contentType:"application/json",
//		data:JSON.stringify(data),
//		success: function(jsonResult){
//			alert("???? xo?? h???c vi??n!");
//		},
//		error: function(jqXhr,textStatus,errorMessage){}
//	});
//}
function deleteStudentToStudentList(x,idStudent){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var data={idStudent:idStudent};
	jQuery.ajax({
		url:"/deleteStudent",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? h???c vi??n!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}

function addNewCourse(){
	var courseName = document.getElementById('courseName').value;
	var description = document.getElementById('description').value;
	var data = {courseName:courseName,description:description};
	var totalLesson = document.getElementById('totalLesson').value;
	jQuery.ajax({
		url:"/addNewCourse",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("Th??m kho?? h???c m???i th??nh c??ng!");
			$('body').load('/courseList');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
function updateInfoCourse(idCourse){
	var courseName = document.getElementById('courseName').value;
	var description = document.getElementById('description').value;
	var totalLesson = document.getElementById('totalLesson').value;
	var data = {courseID:idCourse,courseName:courseName,description:description,totalLesson:totalLesson};
	jQuery.ajax({
		url:"/infoCourse",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("L??u th??ng tin th??nh c??ng!");
			$('body').load('/courseList');
			
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
function deleteCourseToCourseList(x,idCourse){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var data={courseID: idCourse};
	jQuery.ajax({
		url:"/deleteCourse",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? kho?? h???c!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
function addNewTeacher(){
	var  fullName=document.getElementById('fullName').value;
	var  date=document.getElementById('birthday').value;
	var  birthday = new Date(date);
	var	 gender = document.getElementById('gender').value;
	var  phone=document.getElementById('phone').value;
	var  email=document.getElementById('email').value;
	var  address=document.getElementById('address').value;
	var  qualification=document.getElementById('qualification').value;
	var data ={fullName: fullName,birthday: birthday,gender: gender,phone: phone,email: email,address: address,qualification: qualification};
//	alert(fullName+" "+birthday+" "+gender+" "+birthday+" "+phone+" "+email+" "+birthday+" "+qualification);
	jQuery.ajax({
		url:"/addNewTeacher",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("Th??m gi???ng vi??n th??nh c??ng!");
			$('body').load('/teacherList');
		},
		error: function(jqXhr,textStatus,errorMessage){
			alert("L???i");
		}
	});
}
function updateInfoTeacher(idTeacher){
	var  fullName=document.getElementById('fullName').value;
	var  date=document.getElementById('birthday').value;
	var  birthday = new Date(date);
	var	 gender = document.getElementById('gender').value;
	var  phone=document.getElementById('phone').value;
	var  email=document.getElementById('email').value;
	var  address=document.getElementById('address').value;
	var  qualification=document.getElementById('qualification').value;
	var data ={fullName: fullName,birthday: birthday,gender: gender,phone: phone,email: email,address: address,qualification: qualification,teacherID:idTeacher};
	jQuery.ajax({
		url:"/infoTeacher",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("L??u th??ng tin th??nh c??ng!");

			$('body').load('/teacherList');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
function deleteTeacherToTeacherList(x,idTeacher){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var data={teacherID: idTeacher};
	jQuery.ajax({
		url:"/deleteTeacher",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? gi???ng vi??n!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}


function checkAttendance(checkExistSchedule,idClass,className){
	if(checkExistSchedule ==0){
		alert("H??m nay l???p "+className+" kh??ng c?? l???ch h???c!");
		location.reload();
	}else{
		$('body').load('/attendanceList?id='+idClass);
	}
}
function saveAttendanceForClass(idClass){
		var date = document.getElementById("date").value;
		var newLesson = document.getElementById("nextLesson").value ;
		var idteacher = $('#teaccherName').val();
		var enrollmentList = document.getElementById("tbody_modal_attList");
		var tr = enrollmentList.children;
		var attList= [];
		var present=0;
		var absent=0;
		alert(date+" "+newLesson+" "+idteacher);
		for(var i =0;i<tr.length;i++){
			var td =tr[i].getElementsByTagName("td");
			var idStudent =td[0].innerHTML;
			var isAttendants= document.getElementsByName(idStudent);
			var  isAttendant = '';
			for(var j = 0; j < isAttendants.length; j++){
				if(isAttendants[j].checked == true){
					isAttendant = isAttendants[j].value;
					if(isAttendant==1){
						present++;
					}else{
						absent++;
					}	
					break;
				}
			}
			var note=document.getElementById('note').value;
			var attendance={idStudent: idStudent,idTeacher: idteacher,numberOfLesson: newLesson,date: date,isAttendant:isAttendant ,note: note,idClass: idClass};
			
			attList.push(attendance);
		}
		var totalStudent= present+absent;
		jQuery.ajax({
			url:"/attendanceList",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(attList),
			success: function(jsonResult){
				alert("??i h???c "+present+"/"+totalStudent+" V???ng "+absent);
				$('body').load('/attendanceList?id='+idClass);
			},
			error: function(jqXhr,textStatus,errorMessage){
				alert("l???i");
			}
		});
	
}

function addAccountStaff(){
//	alert("Th??m t??i kho???n nh??n vi??n th??nh c??ng!");
	var  fullname=document.getElementById('fullName').value;
	var  date=document.getElementById('birthday').value;
	var  birthday = new Date(date);
	var	 gender = document.getElementById('gender').value;
	var  phone=document.getElementById('phone').value;
	var  email=document.getElementById('email').value;
	var  address=document.getElementById('address').value;
	var idPosition = document.getElementById('idPosition').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var data ={fullname: fullname,birthday: birthday,gender: gender,phone: phone,email: email,address: address,idPosition: idPosition,username: username,password: password};
//	alert(fullName+" "+birthday+" "+gender+" "+phone+" "+email+" "+address+" "+idPosition+" "+username+" "+password);
	jQuery.ajax({
		url:"/addNewAccountStaff",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("Th??m t??i kho???n nh??n vi??n th??nh c??ng!");
			$('body').load('/adminAccount');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}

function deleteAccount(x,idAccount){
//	alert(idAccount);
	var tr = x.parentElement.parentElement;
	tr.remove();
	var data={idAccount: idAccount};
	jQuery.ajax({
		url:"/deleteAccount",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("???? xo?? t??i kho???n!");
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
// t??nh l????ng

function chooseTeacherForPayroll(idTeacher,getMonth){
	var data={idTeacher:idTeacher,curMonth:getMonth};
	jQuery.ajax({
			url:"/chooseTeacher",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success: function(jsonResult){
				$('body').load('/payroll/'+idTeacher+'/'+getMonth);

			},
			error: function(jqXhr,textStatus,errorMessage){
				alert("l???i");
			}
		});
	
}
function chooseMonthForPayroll(idTeacher){
	var getMonth=document.getElementById('month').value;
//	alert(getMonth);
	$('body').load('/payroll/'+idTeacher+'/'+getMonth);

}

function chooseClassForCollectTuitionFee(idClass){
//	alert(idClass);
	var data={idClass: idClass};
	jQuery.ajax({
		url:"/chooseClass",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			$('body').load('/chooseClass/'+idClass);
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}

function saveTuitonFee(idClass,idPaytuition,idStudent){
//	alert(idClass,idStudent)
	var idPt=idPaytuition;
	var payTuition = document.getElementById(idPt).value;
	var data={payTuition: payTuition,idClass: idClass,idStudent: idStudent};
	jQuery.ajax({
			url:"/payTuitionFee",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success: function(jsonResult){
				$('body').load('/chooseClass/'+idClass);
			},
			error: function(jqXhr,textStatus,errorMessage){
				alert("l???i");
			}
		});
}