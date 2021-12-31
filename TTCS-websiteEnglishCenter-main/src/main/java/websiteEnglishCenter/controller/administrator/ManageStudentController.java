package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;
import websiteEnglishCenter.dto.Schedule;

@Controller
public class ManageStudentController {
	@RequestMapping(value = { "/addNewStudent" }, method = RequestMethod.GET)
	public String getAdd(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Student st = new Student();
		model.addAttribute("st",st);
		return "administrator/addNewStudent";

	}
	@RequestMapping(value = { "/addNewStudent" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxAddNewStudent(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Student st){
		System.out.println(st.getFullName()+" "+st.getBirthday()+" "+st.getGender()+" "+st.getPhone()+" "+st.getEmail()+" "+st.getAddress());
		StudentDAO stDAO = new StudentDAO();
		AccountDAO accountDAO =new AccountDAO();
		stDAO.insertNewStudent(st.getFullName(), st.getBirthday(), st.getGender(), st.getPhone(), st.getEmail(), st.getAddress());
		int IdNewStudent= stDAO.getMaxStudentID();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
		
		String password ="HV"+sdf.format(st.getBirthday()).replace("-", "");
		accountDAO.insertAccountStudent(IdNewStudent,st.getEmail(), password);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",st);
		return ResponseEntity.ok(jsonResult);

	}
	@RequestMapping(value = { "/infoStudent" }, method = RequestMethod.GET)
	public String getInfoStudent(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		StudentDAO stDAO = new StudentDAO();
		int idStudent = Integer.parseInt(request.getParameter("id"));
		System.out.println(idStudent);
		Student st = stDAO.getInFoStudentByID(idStudent);
		model.addAttribute("st",st);
		return "administrator/infoStudent";

	}
	@RequestMapping(value = { "/infoStudent" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxUpdateInfoStudent(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Student st){
		System.out.println(st.getFullName()+" "+st.getBirthday()+" "+st.getGender()+" "+st.getPhone()+" "+st.getEmail()+" "+st.getAddress()+st.getIdStudent());
		StudentDAO stDAO = new StudentDAO();
		stDAO.updateInfoStudent(st.getFullName(), st.getBirthday(), st.getGender(), st.getAddress(), st.getPhone(), st.getEmail(),st.getIdStudent());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",st);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/deleteStudent" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteStudent(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Student st){
		System.out.println(st.getIdStudent());
		StudentDAO stDAO = new StudentDAO();		
		AccountDAO accountDAO =new AccountDAO();
		List<Account> aList = accountDAO.getAllAccountStudent();
		for (Account account2 : aList) {
			if (account2.getIdUser()== st.getIdStudent()) {
				accountDAO.deleteAccountByID(account2.getIdAccount());
			}
		}
		stDAO.deleteStudentByID(st.getIdStudent());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",st);
		return ResponseEntity.ok(jsonResult);
	}
	
	
}
