package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.fabric.xmlrpc.base.Data;

import websiteEnglishCenter.dao.AttendanceDAO;
import websiteEnglishCenter.dao.Class1DAO;
import websiteEnglishCenter.dao.ClassDAO;
import websiteEnglishCenter.dao.CollectTuitionDAO;
import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dao.PayrollDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.Attendance;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.LevelComission;
import websiteEnglishCenter.dto.Payroll;
import websiteEnglishCenter.dto.SalaryUnit;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Classmember;
import websiteEnglishCenter.dto.Teacher;
import websiteEnglishCenter.dto.Tuition;

@Controller
public class ManageFinanceController {
	public int getCurMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int curMonth = c.get(Calendar.MONTH);
		return curMonth+1;
	}
	public int getCurYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int curYear = c.get(Calendar.YEAR);
		return curYear;
	}
	@RequestMapping(value = { "/collectTuitionFee" }, method = RequestMethod.GET)
	public String get_collectTuitionFees(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		ClassDAO classDAO = new ClassDAO();
		CourseDAO courseDAO = new CourseDAO();
		CollectTuitionDAO cTuitionDAO = new CollectTuitionDAO();
		List<GeneralClass> cList = classDAO.getAllClass();
		GeneralClass generalClass = new GeneralClass();
		model.addAttribute("infoClass",generalClass);
		List<Classmember> classmemberList = null;
		model.addAttribute("classmemberList",classmemberList);
		List<Student> studentListOfClass = null;
		model.addAttribute("studentListOfClass",studentListOfClass);
		List<Course> courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList", courseList);
		model.addAttribute("titleName", "Quản lý học phí");
		for (GeneralClass generalClass1 : cList) {
			for (Course course : courseList) {
				if (generalClass1.getIdCourse() == course.getCourseID()) {
					generalClass1.setCourseName(course.getCourseName());
				}else {
					continue;
				}
			}
		}
		model.addAttribute("cList",cList);
		
		return "admin/collectTuitionFee";

	}
	@RequestMapping(value = { "/collectTuitionFees" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxCollectTuitionFees(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Classmember classmember) throws IOException{
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",classmember);
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = { "/chooseClass/{idClass}" }, method = RequestMethod.GET)
	public String get_collectTuitionFeesOfClass(final Model model, final HttpServletRequest request, final HttpServletResponse response,@PathVariable("idClass") int idClass)
			throws IOException {
		ClassDAO classDAO = new ClassDAO();
		CourseDAO courseDAO = new CourseDAO();
		StudentDAO studentDAO = new StudentDAO();
		CollectTuitionDAO cTuitionDAO = new CollectTuitionDAO();
		List<GeneralClass> cList = classDAO.getAllClass();
		model.addAttribute("cList",cList);
		GeneralClass infoClass = classDAO.getInfoClassByClassID(idClass);
		System.out.println(infoClass.toString());
		model.addAttribute("infoClass",infoClass);
		List<Student> studentListOfClass = studentDAO.getAllStudentsByClassID(idClass);
		model.addAttribute("studentListOfClass",studentListOfClass);
		List<Classmember> classmemberList = cTuitionDAO.getAllClassmemberByIdClass(idClass);
		model.addAttribute("classmemberList",classmemberList);
		List<Course> courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList", courseList);
		model.addAttribute("titleName", "Quản lý học phí");
		for (GeneralClass generalClass : cList) {
			for (Course course : courseList) {
				if (generalClass.getIdCourse() == course.getCourseID()) {
					generalClass.setCourseName(course.getCourseName());
				}else {
					continue;
				}
			}
		}
		return "admin/collectTuitionFee";

	}
	@RequestMapping(value = {"/chooseClass"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxSaveInfoNewClass(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Classmember stClass) throws IOException{
		StudentDAO studentDAO = new StudentDAO();
		List<Student> studentListOfClass = studentDAO.getAllStudentsByClassID(stClass.getIdClass());
		model.addAttribute("studentListOfClass",studentListOfClass);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",stClass);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = {"/chooseTeacher"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxChooseTeacher(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Payroll payroll) throws IOException{
		HttpSession session = request.getSession();
		TeacherDAO teacherDAO = new TeacherDAO();
		List<Teacher> teachers = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teachers);
		Date date = new Date();
		int curMonth=getCurMonth(date);
		PayrollDAO pDao = new PayrollDAO();
		List<Payroll> payrollList = pDao.getPayrolls(payroll.getIdTeacher(), curMonth);
		session.setAttribute("payrollList", payrollList);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",payroll);
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = { "/payroll/{teacherID}/{getMonth}" }, method = RequestMethod.GET)
	public String get_Payroll(final Model model, final HttpServletRequest request, final HttpServletResponse response
			, @PathVariable("teacherID") int teacherID, @PathVariable("getMonth") int getMonth)
			throws IOException {
		System.out.println(teacherID);
		HttpSession session = request.getSession();
		session.setAttribute("chooseIdTeacher", teacherID);
		model.addAttribute("titleName", "Quản lý lương");
		System.out.println(getMonth);
		
		Date curDate = new Date();
		int getCurYear =getCurYear(curDate);
		PayrollDAO pDao= new PayrollDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		List<Teacher> teachers = teacherDAO.getAllTeachers();
		model.addAttribute("teacherList",teachers);
		ClassDAO classDAO =new ClassDAO();
		List<GeneralClass> cList = classDAO.getAllClass();
		model.addAttribute("cList",cList);
		List<Payroll> payrolls = pDao.getPayrolls(teacherID, getMonth);
		int totalMoney =0;
		for (Payroll payroll : payrolls) {
			if (payroll.getIdTeacher()==teacherID) {
				
				totalMoney+= payroll.getNumberOfTeaching()*payroll.getSalaryUnit();
				
			}
			
		}
		System.out.println(totalMoney);
		session.setAttribute("totalMoney", totalMoney);
		session.setAttribute("payrollList", payrolls);
		model.addAttribute("getCurYear",getCurYear);
		return "admin/payroll";

	}
	@RequestMapping(value = { "/payroll"}, method = RequestMethod.GET)
	public String get_payroll(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		TeacherDAO teacherDAO = new TeacherDAO();
		List<Teacher> teachers = teacherDAO.getAllTeachers();
		ClassDAO classDAO =new ClassDAO();
		List<GeneralClass> cList = classDAO.getAllClass();
		model.addAttribute("cList",cList);
		model.addAttribute("teacherList",teachers);
		model.addAttribute("titleName", "Quản lý lương");
		Date curDate = new Date();
		int getMonth =getCurMonth(curDate);
		int curYear =getCurYear(curDate);
		model.addAttribute("getMonth",getMonth);
		model.addAttribute("getCurYear",curYear);
		HttpSession session = request.getSession();
		session.removeAttribute("chooseIdTeacher");
		session.removeAttribute("payrollList");
		session.removeAttribute("totalMoney");
		return "admin/payroll";

	}
	@RequestMapping(value = { "/payTuitionFee"}, method = RequestMethod.GET)
	public String get_payTuitionFee(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Classmember classmember = new Classmember();
		model.addAttribute("classmember",classmember);
		return "administrator/collectTuitionFee";
	}
	@RequestMapping(value = {"/payTuitionFee"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxPayroll(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Classmember classmember) throws IOException,ParseException{
		System.out.println(classmember.getPayTuition());
		
		
		System.out.println(classmember.getIdClass() +" "+classmember.getIdStudent());
		int paidTuition = 0;
		CollectTuitionDAO cTuitionDAO = new CollectTuitionDAO();
		List<Classmember> cm1 = cTuitionDAO.getAllClassmemberByIdClass(classmember.getIdClass());
		for (Classmember classmember2 : cm1) {
			if (classmember2.getIdStudent()==classmember.getIdStudent()) {
				System.out.println(classmember2.getPaidTuition());
				paidTuition = classmember2.getPaidTuition()+classmember.getPayTuition();
			}
		}
		cTuitionDAO.updateClassmember(classmember.getIdStudent(), classmember.getIdClass(),paidTuition);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",classmember);
		return ResponseEntity.ok(jsonResult);
		
	}
}
