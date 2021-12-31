package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Classroom;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.DayOfWeeks;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;
import websiteEnglishCenter.dto.Schedule;

public class Class1DAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/*get Class*/
	public List<GeneralClass> getAllClass() {
		List<GeneralClass> cList = new ArrayList<GeneralClass>();
		String query = "SELECT class.idclass,class.classname,course.courseName,class.startdate,class.tuitionfees,class.tuitionfeesales\r\n"
				+ "FROM englishcenter.class,englishcenter.course\r\n" + "WHERE class.idcourse=course.idcourse;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				cList.add(new GeneralClass(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5),
						rs.getInt(6)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cList;
	}

	public GeneralClass getInfoClassByClassID(int idClass) {
		GeneralClass classByID = null;
		String query = "SELECT class.idclass,class.classname,course.courseName,class.startdate,class.tuitionfees,class.tuitionfeesales,class.idCourse\r\n"
				+ " FROM englishcenter.class,englishcenter.course WHERE  class.idcourse=course.idcourse AND class.idclass=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			rs = ps.executeQuery();
			while (rs.next()) {
				classByID = new GeneralClass(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5),
						rs.getInt(6),rs.getInt(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return classByID;
	}
	
	/*get Class*/

	/*get Student*/
	public List<Student> getAllStudents() {
		List<Student> studentList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.student;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				studentList.add(new Student(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return studentList;
	}

	public List<Student> getAllStudentsNotInClassByClassID(int idClass) {
		List<Student> studentList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.student where student.idstudent NOT IN (SELECT s.idstudent\r\n"
				+ "FROM englishcenter.classmember cmember,englishcenter.student s where cmember.idstudent=s.idstudent AND cmember.idclass=?)";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			rs = ps.executeQuery();
			while (rs.next()) {
				studentList.add(new Student(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return studentList;
	}

	public List<Student> getAllStudentsByClassID(int idClass) {
		List<Student> studentList = new ArrayList<>();
		String query = "SELECT s.idstudent,s.fullname,s.birthday,s.gender,s.address,s.phone,s.email \r\n"
				+ "FROM englishcenter.classmember cmember,englishcenter.student s where cmember.idstudent=s.idstudent AND cmember.idclass=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			rs = ps.executeQuery();
			while (rs.next()) {
				studentList.add(new Student(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return studentList;
	}
	/*get Student*/

	/*get Teacher*/
	public List<Teacher> getAllTeachers() {
		List<Teacher> teacherList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.teacher;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				teacherList.add(new Teacher(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return teacherList;
	}
	/*get Teacher*/
	
	/*get Course*/
	public List<Course> getAllCourses() {
		List<Course> courseList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.course;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				courseList.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return courseList;
	}
	/*get Course*/
	
	/*create Schedule*/
	public int getMaxScheduleID() {
		String query = "SELECT max(ts.idschedule) FROM englishcenter.schedule ts;";
		int maxScheduleID = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				maxScheduleID = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return maxScheduleID;
	}

	public List<Classroom> getAllClassroom() {
		List<Classroom> clrList = new ArrayList<Classroom>();
		String query = "SELECT * FROM englishcenter.classroom;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				clrList.add(new Classroom(rs.getInt(1), rs.getString(2)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return clrList;
	}

	public List<DayOfWeeks> getAllWeeksday() {
		List<DayOfWeeks> weeksdayList = new ArrayList<DayOfWeeks>();
		String query = "SELECT * FROM englishcenter.weeksday;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				weeksdayList.add(new DayOfWeeks(rs.getInt(1), rs.getString(2)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return weeksdayList;
	}

//	public List<Schedule> getAllTeachingSchedulesByID(int idClass) {
//		List<Schedule> tScheduleByID = new ArrayList<Schedule>();
//		String query = "SELECT ts.idschedule,ts.times,weeksday.weeksday_name,classroom.classroom_name,teacher.fullname FROM englishcenter.teaching_schedule ts,englishcenter.teacher,englishcenter.weeksday,englishcenter.classroom\r\n"
//				+ "where  ts.idclassroom=classroom.idclassroom and ts.idteacher = teacher.idteacher and ts.idweeksday=weeksday.idweeksday and ts.idclass=?;";
//		try {
//			connection = new ConnectDatabase().getConnection();
//			ps = connection.prepareStatement(query);
//			ps.setInt(1, idClass);
//			rs = ps.executeQuery();
//			while (rs.next()) {
//				tScheduleByID.add(new Schedule(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
//
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return tScheduleByID;
//	}
	/*create Schedule*/
	
	/*insert*/
	public void insertNewClass(String className, Date startDate, int tuitionFees, int tuitionFeeSales, int courseID,int teacherID) {
		String query = "INSERT INTO `englishcenter`.`class` (`classname`, `startdate`, `tuitionfees`, `tuitionfeesales`, `idcourse`) VALUES (?, ?, ?, ?, ?, ?);";
		try {
			java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, className);
			ps.setDate(2, sqlStartDate);
			ps.setInt(3, tuitionFees);
			ps.setInt(4, tuitionFeeSales);
			ps.setInt(5, courseID);
			ps.setInt(6, teacherID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void insertStudentToClass(int idStudent, int idClass) {
		String query = "INSERT INTO `englishcenter`.`classmember` (`idclass`, `idstudent`) VALUES (?,?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			ps.setInt(2, idStudent);
			ps.executeUpdate();
			System.out.println("đã thêm thành công: idclass=" + idClass + " idstudent=" + idStudent);
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public void insertSchedule(int idClass, String times, int idWeeksday, int idClassroom, int idTeacher) {
		String query = "INSERT INTO `englishcenter`.`schedule` (`idclass`, `times`, `idweeksday`, `idclassroom`, `idteacher`) VALUES (?,?,?,?,?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			ps.setString(2, times);
			ps.setInt(3, idWeeksday);
			ps.setInt(4, idClassroom);
			ps.setInt(5, idTeacher);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
	/*insert*/
	
	/* update */
	public void updateInfoClass(String className, Date startDate, int tuitionFees, int tuitionFeeSales, int courseID,
			int idClass) {
		String query = "UPDATE `englishcenter`.`class` SET `classname` = ?, `startdate` = ?, `tuitionfees` = ?, `tuitionfeesales` = ?, `idcourse` = ? WHERE (`idclass` = ?);";
		try {
			java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, className);
			ps.setDate(2, sqlStartDate);
			ps.setInt(3, tuitionFees);
			ps.setInt(4, tuitionFeeSales);
			ps.setInt(5, courseID);
			ps.setInt(6, idClass);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	/* update */

	/* delete */
	public void deleteClassByID(int idClass) {
		String query = "DELETE FROM englishcenter.class WHERE class.idclass=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public void deleteCourseByID(String idCourse) {
		String query = "DELETE FROM englishcenter.course WHERE course.idcourse=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, idCourse);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public void deleteStudentByID(String idStudent) {
		String query = "DELETE FROM englishcenter.student WHERE student.idstudent=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, idStudent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public void deleteStudentOfClassByID(int idClass, int idStudent) {
		String query = "DELETE FROM englishcenter.classmember WHERE classmember.idclass=? and classmember.idstudent=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			ps.setInt(2, idStudent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public void deleteScheduleByIdSchedule(int idSchedule) {
		String query = "DELETE FROM englishcenter.schedule WHERE schedule.idschedule=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idSchedule);

			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public void deleteTeacherByID(String idTeacher) {
		String query = "DELETE FROM englishcenter.teacher WHERE teacher.idteacher=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, idTeacher);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	/* delete */

	/* get ID */
	public int getMaxClassID() {
		String query = "SELECT max(class.idclass) FROM englishcenter.class;";
		int maxClassID = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				maxClassID = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return maxClassID;
	}

	public int getIdTeacherByName(String name) {
		String query = "SELECT teacher.idteacher FROM englishcenter.teacher where teacher.fullname like ?;";
		int id = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}

	public int getIdClassroomByName(String name) {
		String query = "SELECT classroom.idclassroom FROM englishcenter.classroom where classroom.classroom_name like ?;";
		int id = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}

	public int getIdCourseByName(String name) {
		String query = "SELECT course.idcourse FROM englishcenter.course where course.courseName like ?;";
		int id = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}

	public int getIdWeeksdayByName(String name) {
		String query = "SELECT weeksday.idweeksday FROM englishcenter.weeksday where weeksday.weeksday_name like ?;";
		int id = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}

	/* get ID */
	public static void main(String[] args) throws ParseException {
		Class1DAO class1DAO = new Class1DAO();
		GeneralClass infoClass = class1DAO.getInfoClassByClassID(2);
		System.out.println(infoClass);
//		List<Student> studentList = dao.getAllStudents();
//		for (Student o : studentList) {
//			System.out.println(o);
//		}
//		
//		List<Student> studentListOfClass = dao.getAllStudentsByClassID(2);
//		for (Student student : studentListOfClass) {
//			System.out.println(student);
//		}
		System.out.println(class1DAO.getMaxScheduleID());
//		dao.deleteStudentOfClassByID("2","1");
//		System.out.println(dao.getIdTeacherByName("Đào Thị Trang"));
//		dao.insertStudentToClass(2, 1);
	}
}
