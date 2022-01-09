package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import websiteEnglishCenter.dao.AccountDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Staff;
import websiteEnglishCenter.dto.StaffPosition;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;

@Controller
public class ManageAccountController {
	//CRUD tài khoản nhân viên
//	@RequestMapping(value = { "/accountList/{seo}" }, method = RequestMethod.GET)
//	public String getAccountList(final Model model, final HttpServletRequest request, final HttpServletResponse response,@ModelAttribute("seo") String seo)
//			throws IOException {
//		AccountDAO accountDAO =new AccountDAO();
//		TeacherDAO tDao =new TeacherDAO();
//		StudentDAO sDao = new StudentDAO();
//		List<Account> aList = null;
//		List<Teacher> tList = tDao.getAllTeachers();
//		List<Student> sList = sDao.getAllStudents();
//		List<Staff> staffList = accountDAO.getAllStaffs();
//		boolean check=false;
//		if (seo.equals("nhan-vien")) {
//			aList =accountDAO.getAllAccountStaff();
//			List<StaffPosition> sPositionList =accountDAO.getAllAccountStaffPosition();
//			model.addAttribute("sPositionList",sPositionList);
//			model.addAttribute("staffList",staffList);
//			check=true;
//		}
//		if (seo.equals("hoc-vien")) {
//			aList =accountDAO.getAllAccountStudent();
//			check=false;
//			model.addAttribute("studentList",sList);
//		}
//		if (seo.equals("giang-vien")) {
//			aList =accountDAO.getAllAccountTeacher();
//			check=false;
//			model.addAttribute("teacherList",tList);
//		}
//		
//		
//		model.addAttribute("accountList",aList);
//		model.addAttribute("checkStaff",check);
//		
//		return "administrator/accountList";
//	}
	
	@RequestMapping(value = { "/adminAccount" }, method = RequestMethod.GET)
	public String getAdminAccountList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		AccountDAO accountDAO =new AccountDAO();
		List<Account> aList = accountDAO.getAllAccountStaff();
		model.addAttribute("adminAccountList",aList);
		return "admin/adminAccount";
	}
	
	@RequestMapping(value = { "/studentAccount" }, method = RequestMethod.GET)
	public String getStudentAccountList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		AccountDAO accountDAO =new AccountDAO();
		List<Account> aList = accountDAO.getAllAccountStudent();
		model.addAttribute("studentAccountList",aList);
		return "admin/studentAccount";
	}
	
	@RequestMapping(value = { "/teacherAccount" }, method = RequestMethod.GET)
	public String getTeacherAccountList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		AccountDAO accountDAO =new AccountDAO();
		List<Account> aList = accountDAO.getAllAccountTeacher();
		model.addAttribute("teacherAccountList",aList);
		return "admin/teacherAccount";
	}
	
	@RequestMapping(value = { "/addNewAccountStaff" }, method = RequestMethod.GET)
	public String getAddAccount(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Account account = new Account();
		model.addAttribute("account",account);
		AccountDAO accountDAO =new AccountDAO();
		List<StaffPosition> sPositionList =accountDAO.getAllAccountStaffPosition();
		model.addAttribute("sPositionList",sPositionList);
		return "admin/addNewAccountStaff";

	}
	@RequestMapping(value = { "/addNewAccountStaff" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxAddNewStudent(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Account account){
		AccountDAO accountDAO =new AccountDAO();
		System.out.println(account.getFullname());
		accountDAO.insertNewStaff(account.getFullname(), account.getBirthday(),account.getGender(), account.getPhone(), account.getEmail(), account.getAddress(),account.getIdPosition());
		int IdNewStaff= accountDAO.getMaxStaffID();
		accountDAO.insertAccountStaff(IdNewStaff,account.getUsername(), account.getPassword(), account.getIdPosition());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",account);
		return ResponseEntity.ok(jsonResult);

	}
	@RequestMapping(value = { "/deleteAccount" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteStudent(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Account account){
		System.out.println(account.getIdAccount());
		AccountDAO accountDAO =new AccountDAO();
		TeacherDAO tDao =new TeacherDAO();
		StudentDAO sDao = new StudentDAO();
		List<Teacher> tList = tDao.getAllTeachers();
		List<Student> sList = sDao.getAllStudents();
		List<Staff> staffList = accountDAO.getAllStaffs();
		Account account1 = accountDAO.getInFoByAccountId(account.getIdAccount());
//		System.out.println(account1.toString());
		if (account1.getIsStaff()==1) {
			accountDAO.deleteStafffByID(account1.getIdUser());
		}
		if (account1.getIsStudent()==1) {
			sDao.deleteStudentByID(account1.getIdUser());
		}
		if (account1.getIsTeacher()==1) {
			tDao.deleteTeacherByID(account1.getIdUser());
		}
		accountDAO.deleteAccountByID(account.getIdAccount());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",account);
		return ResponseEntity.ok(jsonResult);
	}
//	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET)
//	public String getSignupr(final ModelMap model
//			, final HttpServletRequest request
//			, final HttpServletResponse response) throws IOException {
//		CourseDAO courseDAO = new CourseDAO();
//		List<Course> courseList = courseDAO.getAllCourses();
//		model.addAttribute("courseList",courseList);
//			
//		return "user/signup";
//
//	}
//	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
//	public String postSignup(final ModelMap model
//			, final HttpServletRequest request
//			, final HttpServletResponse response) throws IOException, ParseException {
//		String fullname =request.getParameter("fullname");
//		String gender =request.getParameter("gender");
//		String address =request.getParameter("address");
//		
//		String birthday =request.getParameter("birthday");
//		String email =request.getParameter("email");
//		String phone =request.getParameter("phone");
//		String username =request.getParameter("username");
//		String password =request.getParameter("password");
//		String re_password =request.getParameter("re_password");
//		System.out.println(fullname+" "+gender+" "+birthday+" "+email+" "+phone+" "+address+" "+username+" "+password+" "+re_password);
//		AccountDAO aDao =new AccountDAO();
//		Account acc =aDao.checkExistUsername(username);
//		boolean check=false;
//		if (acc == null) {
//			StudentDAO stDAO = new StudentDAO();
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	        Date date = sdf.parse(birthday);
//			java.sql.Date sqlBirthDay = new java.sql.Date(date.getTime());
//			stDAO.insertNewStudent(fullname, sqlBirthDay, gender, phone, email, address);
//			System.out.println(stDAO.getMaxStudentID());
//			aDao.insertAccountStudent(stDAO.getMaxStudentID(), username, re_password);
//			check= true;
//			model.addAttribute("check",check);
//			model.addAttribute("message","Tạo tài khoản thành công!");
//			return "user/signup";
//		}else {
//			check=false;
//			model.addAttribute("check",check);
//			model.addAttribute("message","Tên đăng nhập đã tồn tại. Vui lòng nhâp lại thông tin!");
//			return "user/signup";
//		}
//		
//		
//
//	}
	
}
