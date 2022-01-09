package websiteEnglishCenter.controller.administrator;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
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

import websiteEnglishCenter.dao.AttendanceDAO;
import websiteEnglishCenter.dao.ClassDAO;
import websiteEnglishCenter.dao.CourseDAO;
import websiteEnglishCenter.dao.StudentDAO;
import websiteEnglishCenter.dao.TeacherDAO;
import websiteEnglishCenter.dto.Attendance;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.Schedule;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;

@Controller
public class ManageAttendanceController {
	public int getDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		return dayOfWeek;
	}
	public int getCurMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int curMonth = c.get(Calendar.MONTH);
		return curMonth;
	}
	public List<Attendance> getLessonList(GeneralClass infoClass,List<Course> courseList,List<Schedule> schedulesList) throws ParseException {
		ClassDAO classDAO = new ClassDAO();
		Date startDate =infoClass.getStartDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
		int check=1;
		int totalLesson=0;
		for (Course course : courseList) {
			if (course.getCourseID()==infoClass.getIdCourse()) {
				totalLesson=course.getTotalLesson();
				break;
			}
		}
		List<Attendance> lessonList = new ArrayList<Attendance>();
		Attendance attendance = new Attendance();
		attendance.setDate(sdf.format(startDate));
		lessonList.add(attendance);
		while (check<totalLesson) {
			Attendance attendance1 = new Attendance();
			c.setTime(startDate);
			c.add(Calendar.DATE, 1);  // number of days to add
			startDate = c.getTime();	
			int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
			for (Schedule schedule : schedulesList) {
				if (dayOfWeek==schedule.getIdWeeksday()) {
					check++;
					attendance1.setDate(sdf.format(startDate));
					lessonList.add(attendance1);
				}
			}
		}
		return lessonList;
	}
	@RequestMapping(value = { "/attendanceList" }, method = RequestMethod.GET)
	public String getAttendanceList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String idClass = request.getParameter("id");
		ClassDAO classDAO = new ClassDAO();
		StudentDAO studentDAO = new StudentDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		CourseDAO courseDAO = new CourseDAO();
		AttendanceDAO aDao = new AttendanceDAO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			GeneralClass infoClass = classDAO.getInfoClassByClassID(Integer.parseInt(idClass));
			model.addAttribute("infoClass",infoClass);
			List<Student> studentListOfClass = studentDAO.getAllStudentsByClassID(infoClass.getIdClass());
			model.addAttribute("studentListOfClass",studentListOfClass);
			List<Course> courseList = courseDAO.getAllCourses();
			model.addAttribute("courseList",courseList);
			List<Teacher> teacherList = teacherDAO.getAllTeachers();
			model.addAttribute("teacherList",teacherList);
			
			LocalDate curDate =java.time.LocalDate.now();
			Date curentDate =sdf.parse(curDate.toString());
//			System.out.println(curentDate);
			model.addAttribute("curDate",sdf.format(curentDate));
//			
//			int curentDateToDayOfWeek =dayOfWeek(curentDate);
//			List<Schedule> schedulesList = classDAO.getAllSchedulesByID(infoClass.getIdClass());
//			model.addAttribute("schedulesList",schedulesList);
//			int idScheduleOfClass = 0;
//			for (Schedule schedule : schedulesList) {
//				if (schedule.getIdWeeksday()==curentDateToDayOfWeek) {
//					idScheduleOfClass =schedule.getIdSchedule();
//				}
//			}
//			model.addAttribute("idScheduleOfClass",idScheduleOfClass);
			List<Schedule> schedulesList = classDAO.getAllSchedulesByID(infoClass.getIdClass());
			List<Attendance> aList =aDao.getAttendance(infoClass.getIdClass());
			model.addAttribute("attendanceList",aList);
			List<Attendance> dateOfSchedules =aDao.getDateOfSchedule(infoClass.getIdClass());
			for (Attendance attendance : dateOfSchedules) {
				System.out.println(attendance.toString());
			}
			model.addAttribute("dateOfSchedules",dateOfSchedules);
			
			List<Attendance> listDates =getLessonList(infoClass, courseList, schedulesList);
			model.addAttribute("lessonList",getLessonList(infoClass, courseList, schedulesList));
			int countLesson = aDao.countLesson(infoClass.getIdClass());
			model.addAttribute("countLesson",countLesson);			
		} catch (Exception e) {
			e.getMessage();
		}
		return "admin/attendanceList";
		//return "administrator/attendanceList";

	}
	@RequestMapping(value = { "/attendanceList" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxAddNewCourse(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody List<Attendance> attendanceList) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		AttendanceDAO attDAO = new AttendanceDAO();
		ClassDAO classDAO = new ClassDAO();
		for (Attendance attendance : attendanceList) {
			Date date = sdf.parse(attendance.getDate());
			int DateToDayOfWeek =getDayOfWeek(date);
			List<Schedule> schedulesList = classDAO.getAllSchedulesByID(attendance.getIdClass());
			int idScheduleOfClass = 0;
			for (Schedule schedule : schedulesList) {
				if (schedule.getIdWeeksday()==DateToDayOfWeek) {
					idScheduleOfClass =schedule.getIdSchedule();
					attDAO.insertAttendanceForClass(attendance.getNumberOfLesson(), idScheduleOfClass, attendance.getIdStudent(),
							attendance.getIdTeacher(), attendance.getIsAttendant(), date, attendance.getNote());
				}
			}
		}
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",attendanceList);
		return ResponseEntity.ok(jsonResult);

	}

	public static void main(String[] args) throws ParseException {
		ClassDAO classDAO = new ClassDAO();
		CourseDAO courseDAO = new CourseDAO();
		GeneralClass infoClass = classDAO.getInfoClassByClassID(26);
		List<Course> courseList = courseDAO.getAllCourses();
		List<Schedule> schedulesList = classDAO.getAllSchedulesByID(infoClass.getIdClass());
		System.out.println(new ManageAttendanceController().getLessonList(infoClass, courseList, schedulesList) );
		Date date =new Date();
		System.out.println(new ManageAttendanceController().getCurMonth(date));
		
	}
}
