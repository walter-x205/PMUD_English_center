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
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import websiteEnglishCenter.dao.AccountDAO;
import websiteEnglishCenter.dao.Class1DAO;
import websiteEnglishCenter.dao.ClassDAO;
import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dao.StatisticalDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.SignIn;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Admin;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;

@Controller
public class AdminHomepageController {
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String admin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		StatisticalDAO sDao = new StatisticalDAO();
		int countClass =sDao.countAllClass(); 
		int countStudent =sDao.countAllStudent(); 
		int countTeacher =sDao.countAllTeacher(); 
		int countCourse =sDao.countAllCourse();
		model.addAttribute("titleName", "Home");
		model.addAttribute("countClass", countClass);
		model.addAttribute("countStudent", countStudent);
		model.addAttribute("countTeacher", countTeacher);
		model.addAttribute("countCourse", countCourse);		
		return "admin/admin";

	}
	@RequestMapping(value = { "/classList" }, method = RequestMethod.GET)
	public String listWrapper(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		ClassDAO classDAO = new ClassDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		CourseDAO course = new CourseDAO();
		List<GeneralClass> cList = classDAO.getAllClassOrderById();
		model.addAttribute("cList",cList);
		List<Teacher> teacherList = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teacherList);
		List<Course> courseList = course.getAllCourses();
		model.addAttribute("courseList",courseList);
		model.addAttribute("titleName", "Quản lý lớp học");
//		return "administrator/classList";
		return "admin/classList";
	}
	
	
	@RequestMapping(value = { "/studentList" }, method = RequestMethod.GET)
	public String getStudentList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		StudentDAO stDAO = new StudentDAO();
		List<Student> studentList = stDAO.getAllStudents();
		model.addAttribute("studentList",studentList);
		model.addAttribute("titleName", "Quản lý học viên");
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
		model.addAttribute("titleName", "Quản lý khoá học");
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
		model.addAttribute("titleName", "Quản lý giảng viên");
		return "admin/teacherList";
//		return "administrator/teacherList";
	}
	
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String homepage(ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		SignIn login = new SignIn();
		model.addAttribute("admin-login", login);
		return "admin/homepage";
	}
	
	@RequestMapping(value = { "/ad-login" }, method = RequestMethod.POST)
	public String doAdLogin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			final @ModelAttribute("admin-login") SignIn login)
			throws IOException {
		model.addAttribute("admin-login", login);
		AccountDAO dao = new AccountDAO();
		Admin log = new Admin();
		log = dao.adminSignIn(login.getUsername(), login.getPassword());
		if (log == null) {
			model.addAttribute("mess", "Username or Password is not correct");
			return homepage(model, request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("admin", log);
			return "admin/admin";
		}
	}
	
	@RequestMapping(value = { "/ad-logout" }, method = RequestMethod.GET)
	public String doLogout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return homepage(model, request, response);
	}
}
