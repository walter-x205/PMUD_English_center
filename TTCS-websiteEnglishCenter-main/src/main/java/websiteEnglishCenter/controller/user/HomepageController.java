package websiteEnglishCenter.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dto.Course;

@Controller
public class HomepageController {
	@RequestMapping(value = { "/homepage" }, method = RequestMethod.GET)
	public String getHomepage(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		CourseDAO courseDAO =new CourseDAO();
		List<Course> courseList = courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
		for (Course course : courseList) {
			System.out.println(course.getCourseName());
		}
			
		return "user/homepage";

	}
	@RequestMapping(value = { "/personalpage" }, method = RequestMethod.GET)
	public String getPersonalpage(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		
			
		return "user/personalpage";

	}
	@RequestMapping(value = { "/course/{courseID}" }, method = RequestMethod.GET)
	public String getCategory(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response,@ModelAttribute("courseID") int courseID) throws IOException {
		CourseDAO courseDAO =new CourseDAO();
		List<Course> courseList = courseList = courseDAO.getAllCourses();
		model.addAttribute("courseList",courseList);
		Course infoCourse = courseDAO.getInFoCourseByID(courseID);
		model.addAttribute("infoCourse",infoCourse);
		
		return "user/course";

	}
	@RequestMapping(value = { "/course" }, method = RequestMethod.GET)
	public String getInfoCourse(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		
			
		return "user/course";

	}
	@RequestMapping(value = { "/teachingClass" }, method = RequestMethod.GET)
	public String getTeachingClass(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		
			
		return "user/teachingclass";

	}
}
