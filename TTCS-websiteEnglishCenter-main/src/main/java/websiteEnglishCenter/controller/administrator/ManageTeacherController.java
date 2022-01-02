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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import websiteEnglishCenter.dao.AccountDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Teacher;

@Controller
public class ManageTeacherController {
	@RequestMapping(value = { "/addNewTeacher" }, method = RequestMethod.GET)
	public String getAdd(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Teacher teacher =new Teacher();
		model.addAttribute("teacher",teacher);
		model.addAttribute("titleForm", "Danh sách giảng viên");
		return "admin/addNewTeacher";

	}
	@RequestMapping(value = { "/addNewTeacher" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxAddNewTeacher(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Teacher teacher){
		System.out.println(teacher.getFullName()+" "+teacher.getBirthday()+" "+teacher.getGender()+" "+teacher.getPhone()+" "
			+teacher.getEmail()+" "+teacher.getAddress()+" "+teacher.getQualification());
		TeacherDAO tDao =new TeacherDAO();
		AccountDAO accountDAO =new AccountDAO();
		tDao.insertNewTeacher(teacher.getFullName(), teacher.getBirthday(), teacher.getGender(), teacher.getAddress(), teacher.getPhone(), teacher.getEmail(), teacher.getQualification());
		int IdNewTeacher= tDao.getMaxTeacherID();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
		
		String password ="GV"+sdf.format(teacher.getBirthday()).replace("-", "");
		accountDAO.insertAccountTeacher(IdNewTeacher,teacher.getEmail(), password);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",teacher);
		return ResponseEntity.ok(jsonResult);

	}
	@RequestMapping(value = { "/infoTeacher" }, method = RequestMethod.GET)
	public String getInfoTeacher(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		TeacherDAO teacherDAO =new TeacherDAO();
		int idTeacher = Integer.parseInt(request.getParameter("id"));
		System.out.println(idTeacher);
		Teacher teacher = teacherDAO.getInFoTeacherByID(idTeacher);
		model.addAttribute("teacher",teacher);
		return "admin/infoTeacher";

	}
	@RequestMapping(value = { "/infoTeacher" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxUpdateInfoTeacher(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Teacher teacher){
//		System.out.println(teacher.getFullName()+" "+ teacher.getBirthday()+" "+teacher.getGender()+" "+teacher.getAddress()+" "+teacher.getPhone()+" "+ teacher.getEmail()+" "+teacher.getQualification()+" "+teacher.getTeacherID());
		TeacherDAO tDAO = new TeacherDAO();
		tDAO.updateInfoTeacher(teacher.getFullName(), teacher.getBirthday(), teacher.getGender(), teacher.getAddress(), teacher.getPhone(), teacher.getEmail(),teacher.getQualification(),teacher.getTeacherID());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",teacher);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/deleteTeacher" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteTeacher(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Teacher teacher){
		TeacherDAO tDAO = new TeacherDAO();
//		System.out.println(teacher.getTeacherID());
		AccountDAO accountDAO =new AccountDAO();
		List<Account> aList = accountDAO.getAllAccountTeacher();
		for (Account account2 : aList) {
			if (account2.getIdUser()== teacher.getTeacherID()) {
				accountDAO.deleteAccountByID(account2.getIdAccount());
			}
		}
		tDAO.deleteTeacherByID(teacher.getTeacherID());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",teacher);
		return ResponseEntity.ok(jsonResult);
	}
	
	
}
