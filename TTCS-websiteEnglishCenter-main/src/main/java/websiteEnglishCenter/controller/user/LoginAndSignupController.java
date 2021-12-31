package websiteEnglishCenter.controller.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import websiteEnglishCenter.dao.AccountDAO;
import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dao.SubscriberDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.Staff;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Subscriber;
import websiteEnglishCenter.dto.Teacher;

@Controller
public class LoginAndSignupController {
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String getLogin(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		Account user = new Account();
		model.addAttribute("user",user);
		return "user/login";

	}
	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String postLogin(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+" "+password);
		AccountDAO aDao =new AccountDAO();
		Account acc= new Account();
		
		acc = aDao.getAccountByUsername(username, password);
		if (acc == null) {
			model.addAttribute("mess","Nhập sai tên đăng nhập hoặc mật khẩu!");
			return "user/login";
		}else {
			if (acc.getIsStudent()==1) {
				StudentDAO studentDAO = new StudentDAO();
				Student st =studentDAO.getInFoStudentByID(acc.getIdUser());
				acc.setFullname(st.getFullName());
				acc.setAddress(st.getAddress());
				acc.setEmail(st.getEmail());
				acc.setPhone(st.getPhone());
				acc.setBirthday(st.getBirthday());
				acc.setGender(st.getGender());
				acc.setIdUser(st.getIdStudent());
			}
			if (acc.getIsTeacher() ==1) {
				TeacherDAO teacherDAO = new TeacherDAO();
				Teacher teacher = teacherDAO.getInFoTeacherByID(acc.getIdUser());
				acc.setFullname(teacher.getFullName());
				acc.setAddress(teacher.getAddress());
				acc.setEmail(teacher.getEmail());
				acc.setPhone(teacher.getPhone());
				acc.setBirthday(teacher.getBirthday());
				acc.setGender(teacher.getGender());
				acc.setIdUser(teacher.getTeacherID());
			}
			if(acc.getIsStaff()==1) {
				//tạm lấy trong tbl student
				Staff st = aDao.getInFoByStaff(acc.getIdUser());
				acc.setFullname(st.getFullName());
				HttpSession session = request.getSession();
				session.setAttribute("account", acc);
				return "administrator/admin";
			}
			HttpSession session = request.getSession();
			session.setAttribute("account", acc);
			CourseDAO courseDAO =new CourseDAO();
			List<Course> courseList = courseList = courseDAO.getAllCourses();
			model.addAttribute("courseList",courseList);
//			System.out.println(acc);
			return "user/homepage";
		}
		
		
	}
	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET)
	public String getSignupr(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		CourseDAO courseDAO = new CourseDAO();
		List<Course> courseList = courseDAO.getAllCourses();
		
		model.addAttribute("courseList",courseList);
			
		return "user/signup";

	}
	@RequestMapping(value = { "/ajax/signup" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxAddNewCourse(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Subscriber subscriber){
		SubscriberDAO sub= new SubscriberDAO();

		System.out.println(subscriber.getIdStudent());
		if (subscriber.getIdStudent()==0) {
			sub.insertNewSubsctiber(subscriber.getFullName(), subscriber.getBirthday(), subscriber.getGender(), subscriber.getAddress(), subscriber.getPhone()
					, subscriber.getEmail(), subscriber.getQuestion(),subscriber.getRigisDate(), subscriber.getIdCourse());
		} else {
//			sub.insertNewSubsctiber(subscriber.getFullName(), subscriber.getBirthday(), subscriber.getGender(), subscriber.getAddress(), subscriber.getPhone()
//					, subscriber.getEmail(), subscriber.getQuestion(),subscriber.getRigisDate(), subscriber.getIdCourse(), subscriber.getIdStudent());
		}
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",subscriber);
		return ResponseEntity.ok(jsonResult);

	}
	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String getLogout(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("account");
		return "user/homepage";

	}
}
