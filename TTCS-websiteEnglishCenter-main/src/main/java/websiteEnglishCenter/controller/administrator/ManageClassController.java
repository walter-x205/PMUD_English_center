package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
import websiteEnglishCenter.dto.Subscriber;
import websiteEnglishCenter.dto.Teacher;
import websiteEnglishCenter.dto.Schedule;

@Controller
public class ManageClassController {
	@RequestMapping(value = { "/addNewClass" }, method = RequestMethod.GET)
	public String addInfo(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		ClassDAO classDAO = new ClassDAO();
		CourseDAO courseDAO = new CourseDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		List<Course> courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
		List<Teacher> teacherList = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teacherList);
		List<Classroom> clrList = classDAO.getAllClassroom();
		model.addAttribute("clrList", clrList);
		List<DayOfWeeks> weeksdayList = classDAO.getAllWeeksday();
		model.addAttribute("weeksdayList", weeksdayList);
		return "admin/addNewClass";

	}
	@RequestMapping(value = {"/addNewClass"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxCreateNewClass(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody GeneralClass gClass) throws IOException{
		ClassDAO classDAO = new ClassDAO();
		CourseDAO courseDAO = new CourseDAO();
		List<Course> courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
//		System.out.println(gClass.getClassName()+gClass.getIdCourse());
		classDAO.insertNewClass(gClass.getClassName(), gClass.getStartDate(), gClass.getTuitionFees(), gClass.getTuitionFeeSales(), gClass.getIdCourse(),gClass.getIdTeacher());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",gClass);
		return ResponseEntity.ok(jsonResult);
		
	}
//	@RequestMapping(value = {"/infoNewClass"}, method = RequestMethod.GET)
//	public String getClassInfo(final Model model, final HttpServletRequest request, final HttpServletResponse response)
//			throws IOException {
//		
//		Class1DAO class1DAO = new Class1DAO();
//		System.out.println("idClass:" +class1DAO.getMaxClassID());
//		List<Student> studentList = class1DAO.getAllStudents();
//		model.addAttribute("studentList",studentList);
//		
//		List<Student> studentListNotInClass = class1DAO.getAllStudentsNotInClassByClassID(class1DAO.getMaxClassID());
//		model.addAttribute("studentListNotInClass",studentListNotInClass);
//		
//		GeneralClass infoClass = class1DAO.getInfoClassByClassID(class1DAO.getMaxClassID());
//		model.addAttribute("infoClass",infoClass);
//		
//		List<Teacher> teacherList = class1DAO.getAllTeachers();
//		model.addAttribute("teacherList",teacherList);
//		List<Classroom> clrList = class1DAO.getAllClassroom();
//		model.addAttribute("clrList", clrList);
//		List<DayOfWeeks> weeksdayList = class1DAO.getAllWeeksday();
//		model.addAttribute("weeksdayList", weeksdayList);
//		List<Schedule> schedulesList = class1DAO.getAllTeachingSchedulesByID(class1DAO.getMaxClassID());
//		model.addAttribute("schedulesList",schedulesList);
////		System.out.println("id2"+classDAO.getMaxClassID());
//		List<Student> studentListOfClass = class1DAO.getAllStudentsByClassID(class1DAO.getMaxClassID());
//		model.addAttribute("studentListOfClass",studentListOfClass);
//		int maxScheduleID = class1DAO.getMaxScheduleID();
//		model.addAttribute("maxScheduleID",maxScheduleID);	
//		List<Course> courseList = class1DAO.getAllCourses();
//		model.addAttribute("courseList",courseList);
//		SubscriberDAO sub= new SubscriberDAO();
//		List<Subscriber> subscriberList = sub.getAllSubscribersByIdCourse(infoClass.getIdCourse());
//		model.addAttribute("subscriberList",subscriberList);
//		return "administrator/infoClass";
//	}
	@RequestMapping(value = {"/infoNewClass"}, method = RequestMethod.GET)
	public String getClassInfo(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		ClassDAO classDAO = new ClassDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		StudentDAO studentDAO = new StudentDAO();
		CourseDAO courseDAO = new CourseDAO();
		SubscriberDAO sub= new SubscriberDAO();
		System.out.println(classDAO.getMaxClassID());
		//l???y danh s??ch h???c vi??n c???a trung t??m
		List<Student> studentList = studentDAO.getAllStudents();
		model.addAttribute("studentList",studentList);
		// l???y danh s??ch h???c vi??n ch??a c?? trong danh s??ch l???p b???ng id l???p
		List<Student> studentListNotInClass = studentDAO.getAllStudentsNotInClassByClassID(classDAO.getMaxClassID());
		model.addAttribute("studentListNotInClass",studentListNotInClass);
		//l???y th??ng tin l???p h???c b???ng id l???p
		GeneralClass infoClass = classDAO.getInfoClassByClassID(classDAO.getMaxClassID());
		model.addAttribute("infoClass",infoClass);
		// l???y danh s??ch giagnr vi??n
		List<Teacher> teacherList = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teacherList);
		//l???y danh s??ch kho?? h???c
		List<Course> courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
		
		
		//l???y danh s??ch ph??ng h???c
		List<Classroom> clrList = classDAO.getAllClassroom();
		model.addAttribute("clrList", clrList);
		// l???y th??? trong tu???n
		List<DayOfWeeks> weeksdayList = classDAO.getAllWeeksday();
		model.addAttribute("weeksdayList", weeksdayList);
		// l???y danh s??ch l???ch h???c
		List<Schedule> schedulesList = classDAO.getAllSchedulesByID(classDAO.getMaxClassID());
		model.addAttribute("schedulesList",schedulesList);
		// l???y danh s??ch h???c vi??n c???a l???p h???c b???ng id l???p
		List<Student> studentListOfClass = studentDAO.getAllStudentsByClassID(classDAO.getMaxClassID());
		model.addAttribute("studentListOfClass",studentListOfClass);

		//l???y id l???ch h???c l???n nh???t
		int maxScheduleID = classDAO.getMaxScheduleID();
		model.addAttribute("maxScheduleID",maxScheduleID);
		
		//l???y danh s??ch ng?????i ????ng k?? h???c
		List<Subscriber> subscriberList = sub.getAllSubscribersByIdCourse(infoClass.getIdCourse());
		model.addAttribute("subscriberList",subscriberList);
		return "administrator/infoClass";
	}
	@RequestMapping(value = {"/infoNewClass"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxSaveInfoNewClass(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody GeneralClass gClass) throws IOException{
		System.out.println(gClass.getClassName()+" "+gClass.getCourseName()+" "+gClass.getTuitionFees()+" "+gClass.getTuitionFeeSales()+" "+gClass.getStartDate()+" "+gClass.getIdClass());
		Class1DAO class1DAO = new Class1DAO();
		int idCourse = class1DAO.getIdCourseByName(gClass.getCourseName());
		class1DAO.updateInfoClass(gClass.getClassName(), gClass.getStartDate(), gClass.getTuitionFees(), gClass.getTuitionFeeSales(), idCourse, gClass.getIdClass());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",gClass);
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = {"/deleteClass"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteClass(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody GeneralClass gClass) throws IOException{
		Class1DAO class1DAO = new Class1DAO();
		System.out.println(gClass.getIdClass());
		class1DAO.deleteClassByID(gClass.getIdClass());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",gClass);
		return ResponseEntity.ok(jsonResult);	
	}
}
