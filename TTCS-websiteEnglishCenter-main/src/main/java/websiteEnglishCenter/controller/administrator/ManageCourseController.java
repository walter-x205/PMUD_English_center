package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.Student;

@Controller
public class ManageCourseController {
	@RequestMapping(value = { "/addNewCourse" }, method = RequestMethod.GET)
	public String getAdd(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Course course =new Course();
		model.addAttribute("course",course);
		return "admin/addNewCourse";

	}
	@RequestMapping(value = { "/addNewCourse" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxAddNewCourse(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Course course){
		System.out.println(course.getCourseName()+" "+course.getDescription());
		CourseDAO courseDAO = new CourseDAO();
		courseDAO.insertNewCourse(course.getCourseName(), course.getDescription(),course.getTotalLesson());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",course);
		return ResponseEntity.ok(jsonResult);

	}
	@RequestMapping(value = { "/infoCourse" }, method = RequestMethod.GET)
	public String getinfoCourse(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		CourseDAO courseDAO = new CourseDAO();
		int idCourse = Integer.parseInt(request.getParameter("id"));
		Course course = courseDAO.getInFoCourseByID(idCourse);
		model.addAttribute("course",course);
		return "admin/infoCourse";

	}
	@RequestMapping(value = { "/infoCourse" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxUpdateInfoCourse(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Course course){
		CourseDAO courseDAO = new CourseDAO();
		System.out.println(course.getTotalLesson());
		courseDAO.updateInfoCourse(course.getCourseName(), course.getDescription(), course.getCourseID(),course.getTotalLesson());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",course);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/deleteCourse" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteCourse(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Course course){
		System.out.println(course.getCourseID());
		CourseDAO courseDAO = new CourseDAO();
		courseDAO.deleteCourseByID(course.getCourseID());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",course);
		return ResponseEntity.ok(jsonResult);
	}
}
