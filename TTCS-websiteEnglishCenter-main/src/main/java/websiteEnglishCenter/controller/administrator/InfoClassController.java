package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import websiteEnglishCenter.dao.AccountDAO;
import websiteEnglishCenter.dao.Class1DAO;
import websiteEnglishCenter.dao.ClassDAO;
import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dao.SubscriberDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.Classroom;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.DayOfWeeks;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Classmember;
import websiteEnglishCenter.dto.Subscriber;
import websiteEnglishCenter.dto.Teacher;
import websiteEnglishCenter.dto.Schedule;

@Controller
public class InfoClassController {
	
	@RequestMapping(value = {"/infoClass"}, method = RequestMethod.GET)
	public String getClassInfo(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException, ParseException {
		String idClass = request.getParameter("id");
		ClassDAO classDAO = new ClassDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		StudentDAO studentDAO = new StudentDAO();
		CourseDAO courseDAO = new CourseDAO();
		SubscriberDAO sub= new SubscriberDAO();
		//lấy thông tin lớp học bằng id lớp
		GeneralClass infoClass = classDAO.getInfoClassByClassID(Integer.parseInt(idClass));
		model.addAttribute("infoClass",infoClass);
		// lấy danh sách giagnr viên
		List<Teacher> teacherList = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teacherList);
		//lấy danh sách khoá học
		List<Course> courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
		//lấy danh sách học viên của trung tâm
		List<Student> studentList = studentDAO.getAllStudents();
		model.addAttribute("studentList",studentList);
		
		//lấy danh sách phòng học
		List<Classroom> clrList = classDAO.getAllClassroom();
		model.addAttribute("clrList", clrList);
		// lấy thứ trong tuần
		List<DayOfWeeks> weeksdayList = classDAO.getAllWeeksday();
		model.addAttribute("weeksdayList", weeksdayList);
		
		
		LocalDate curDate =java.time.LocalDate.now();
		model.addAttribute("curDate",curDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date curentDate =sdf.parse(curDate.toString());
		int curentDateToDayOfWeek = new ManageAttendanceController().getDayOfWeek(curentDate);
		// lấy danh sách lịch học
		List<Schedule> schedulesList = classDAO.getAllSchedulesByID(Integer.parseInt(idClass));
		model.addAttribute("schedulesList",schedulesList);
		int checkExistSchedule = 0;
		for (Schedule schedule : schedulesList) {
			if (schedule.getIdWeeksday()==curentDateToDayOfWeek) {
				checkExistSchedule =schedule.getIdSchedule();
			}
		}
		model.addAttribute("checkExistSchedule",checkExistSchedule);

		// lấy danh sách học viên của lớp học bằng id lớp
		List<Student> studentListOfClass = studentDAO.getAllStudentsByClassID(Integer.parseInt(idClass));
		model.addAttribute("studentListOfClass",studentListOfClass);
		// lấy danh sách học viên chưa có trong danh sách lớp bằng id lớp
		List<Student> studentListNotInClass = studentDAO.getAllStudentsNotInClassByClassID(Integer.parseInt(idClass));
		model.addAttribute("studentListNotInClass",studentListNotInClass);
		//lấy id lịch học lớn nhất
		int maxScheduleID = classDAO.getMaxScheduleID();
		model.addAttribute("maxScheduleID",maxScheduleID);

		//lấy danh sách người đăng ký học
		List<Subscriber> subscriberList = sub.getAllSubscribersByIdCourse(infoClass.getIdCourse());
		model.addAttribute("subscriberList",subscriberList);
		
		return "administrator/infoClass";
	}
	@RequestMapping(value = {"/infoClass/{ClassID}"}, method = RequestMethod.GET)
	public String getClassInfo(final Model model, final HttpServletRequest request, final HttpServletResponse response, @PathVariable("ClassID") int ClassID)
			throws IOException, ParseException {
//		String idClass = request.getParameter("id");
		String idClass = ClassID+"";
		ClassDAO classDAO = new ClassDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		StudentDAO studentDAO = new StudentDAO();
		CourseDAO courseDAO = new CourseDAO();
		SubscriberDAO sub= new SubscriberDAO();
		//lấy thông tin lớp học bằng id lớp
		GeneralClass infoClass = classDAO.getInfoClassByClassID(Integer.parseInt(idClass));
		model.addAttribute("infoClass",infoClass);
		// lấy danh sách giagnr viên
		List<Teacher> teacherList = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teacherList);
		//lấy danh sách khoá học
		List<Course> courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
		//lấy danh sách học viên của trung tâm
		List<Student> studentList = studentDAO.getAllStudents();
		model.addAttribute("studentList",studentList);
		
		//lấy danh sách phòng học
		List<Classroom> clrList = classDAO.getAllClassroom();
		model.addAttribute("clrList", clrList);
		// lấy thứ trong tuần
		List<DayOfWeeks> weeksdayList = classDAO.getAllWeeksday();
		model.addAttribute("weeksdayList", weeksdayList);
		
		
		LocalDate curDate =java.time.LocalDate.now();
		model.addAttribute("curDate",curDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date curentDate =sdf.parse(curDate.toString());
		int curentDateToDayOfWeek = new ManageAttendanceController().getDayOfWeek(curentDate);
		// lấy danh sách lịch học
		List<Schedule> schedulesList = classDAO.getAllSchedulesByID(Integer.parseInt(idClass));
		model.addAttribute("schedulesList",schedulesList);
		int checkExistSchedule = 0;
		for (Schedule schedule : schedulesList) {
			if (schedule.getIdWeeksday()==curentDateToDayOfWeek) {
				checkExistSchedule =schedule.getIdSchedule();
			}
		}
		model.addAttribute("checkExistSchedule",checkExistSchedule);
		
		// lấy danh sách học viên của lớp học bằng id lớp
		List<Student> studentListOfClass = studentDAO.getAllStudentsByClassID(Integer.parseInt(idClass));
		model.addAttribute("studentListOfClass",studentListOfClass);
		// lấy danh sách học viên chưa có trong danh sách lớp bằng id lớp
		List<Student> studentListNotInClass = studentDAO.getAllStudentsNotInClassByClassID(Integer.parseInt(idClass));
		model.addAttribute("studentListNotInClass",studentListNotInClass);
		//lấy id lịch học lớn nhất
		int maxScheduleID = classDAO.getMaxScheduleID();
		model.addAttribute("maxScheduleID",maxScheduleID);
		
		//lấy danh sách người đăng ký học
		List<Subscriber> subscriberList = sub.getAllSubscribersByIdCourse(infoClass.getIdCourse());
		model.addAttribute("subscriberList",subscriberList);
		
		return "administrator/infoClass";
	}
	@RequestMapping(value = {"/infoClass"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxSaveInfoNewClass(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody GeneralClass gClass) throws IOException{
//		System.out.println(gClass.getClassName()+" "+gClass.getCourseName()+" "+gClass.getTuitionFees()+" "+gClass.getTuitionFeeSales()+" "+gClass.getStartDate()+" "+gClass.getIdClass());
		Class1DAO class1DAO = new Class1DAO();
		int idCourse = class1DAO.getIdCourseByName(gClass.getCourseName());
		class1DAO.updateInfoClass(gClass.getClassName(), gClass.getStartDate(), gClass.getTuitionFees(), gClass.getTuitionFeeSales(), idCourse, gClass.getIdClass());
		return null;
		
	}
	@RequestMapping(value = { "/addStudentToClass" }, method = RequestMethod.GET)
	public String addStudentToClass(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Class1DAO class1DAO = new Class1DAO();
		ClassDAO classDAO = new ClassDAO();
		SubscriberDAO subscriberDAO = new SubscriberDAO();
		List<Classmember> stClass = new ArrayList<Classmember>();
//		stClass = subscriberDAO.getAllSubscribersByIdCourse(0)
		model.addAttribute("stClass",stClass);
		return "administrator/infoClass";
	}
	@RequestMapping(value = {"/addStudentToClass"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxAddStudentToClass(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody List<Classmember> stClass) throws IOException{
		Class1DAO class1DAO = new Class1DAO();
		StudentDAO studentDAO = new StudentDAO();
		SubscriberDAO subDAO= new SubscriberDAO();
		AccountDAO accountDAO =new AccountDAO();
		for (Classmember classmember : stClass) {
			System.out.println(classmember.getIdStudent()+" "+classmember.getPhone());
			if(classmember.getIdStudent()==0) {
				//lấy thông tin ng đăng ký học
				Subscriber sub = subDAO.getInFoSubscriberByPhone(classmember.getPhone());
				System.out.println("dhhsg"+sub.getIdSubscriber()+classmember.getPhone());
				
				studentDAO.insertNewStudent(sub.getFullName(), sub.getBirthday(), sub.getGender(), sub.getPhone(), sub.getEmail(), sub.getAddress());
				class1DAO.insertStudentToClass(studentDAO.getMaxStudentID(),classmember.getIdClass());
				subDAO.deleteSubcriberByID(sub.getIdSubscriber());
				int IdNewStudent= studentDAO.getMaxStudentID();
				SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
				
				String password ="HV"+sdf.format(sub.getBirthday()).replace("-", "");
				accountDAO.insertAccountStudent(IdNewStudent,sub.getEmail(), password);
			}else {
				class1DAO.insertStudentToClass(classmember.getIdStudent(),classmember.getIdClass());
				System.out.println("5test ok");
			}
			
		}
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",stClass);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/addSchedule" }, method = RequestMethod.GET)
	public String createSchedule(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
			Schedule tSchedule = new Schedule();
			model.addAttribute("tSchedule",tSchedule);
			Class1DAO class1DAO =new Class1DAO();
		return "administrator/infoClass";
	}
	@RequestMapping(value = {"/addSchedule"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxCreateSchedule(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Schedule tSchedule) throws IOException{
		ClassDAO classDAO =new ClassDAO();
		int idWeeksday = classDAO.getIdWeeksdayByName(tSchedule.getWeeksday());
		int idClassroom = classDAO.getIdClassroomByName(tSchedule.getClassroomName());
		classDAO.insertSchedule(tSchedule.getIdClass(), tSchedule.getTimes(),idWeeksday , idClassroom);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",tSchedule);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = {"/deleteSchedule"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteSchedule(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Schedule tSchedule) throws IOException{
		System.out.println(tSchedule.getIdSchedule()+" "+tSchedule.getIdClass());
		ClassDAO classDAO =new ClassDAO();
		classDAO.deleteScheduleByIdSchedule(tSchedule.getIdSchedule());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",tSchedule);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = {"/deleteStudentToStudentList"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteStudentToStudentList(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Classmember stClass) throws IOException{
		System.out.println(stClass.getIdStudent()+" "+stClass.getIdClass());
		Class1DAO class1DAO =new Class1DAO();
		class1DAO.deleteStudentOfClassByID(stClass.getIdClass(),stClass.getIdStudent());
		
		return null;
	}
	
	
}
