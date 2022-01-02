package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import websiteEnglishCenter.dao.AccountDAO;
import websiteEnglishCenter.dao.Class1DAO;
import websiteEnglishCenter.dao.ClassDAO;
import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;

@Controller
public class AdminHomepageController {
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String admin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "admin/admin";

	}
	@RequestMapping(value = { "/classList" }, method = RequestMethod.GET)
	public String listWrapper(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		ClassDAO classDAO = new ClassDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		CourseDAO course = new CourseDAO();
		List<GeneralClass> cList = classDAO.getAllClass();
		model.addAttribute("cList",cList);
		List<Teacher> teacherList = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teacherList);
		List<Course> courseList = course.getAllCourses();
		model.addAttribute("courseList",courseList);
//		return "administrator/classList";
		return "admin/classList";
	}
	
	
	@RequestMapping(value = { "/studentList" }, method = RequestMethod.GET)
	public String getStudentList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		StudentDAO stDAO = new StudentDAO();
		List<Student> studentList = stDAO.getAllStudents();
		model.addAttribute("studentList",studentList);
		return "admin/studentList";
//		return "administrator/studentList";
	}
	@RequestMapping(value = { "/courseList" }, method = RequestMethod.GET)
	public String getCourseList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		List<Course> courseList = new ArrayList();
		CourseDAO courseDAO = new CourseDAO();
		courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
//		return "administrator/courseList";
		return "admin/courseList";
	}
	@RequestMapping(value = { "/teacherList" }, method = RequestMethod.GET)
	public String getTeacherList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		List<Teacher> teacherList = new ArrayList();
		TeacherDAO teacherDAO = new TeacherDAO();
		teacherList = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teacherList);
		model.addAttribute("titleForm", "Danh sách giảng viên");
		return "admin/teacherList";
//		return "administrator/teacherList";
	}
	

}
