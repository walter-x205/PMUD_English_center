package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Classroom;
import websiteEnglishCenter.dto.DayOfWeeks;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.Schedule;

public class ClassDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public List<GeneralClass> getAllClass() {
		List<GeneralClass> cList = new ArrayList<GeneralClass>();
		String query = "SELECT * FROM englishcenter.class;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				cList.add(new GeneralClass(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7),rs.getInt(8)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cList;
	}
	
	public GeneralClass getInfoClassByClassID(int idClass) {
		GeneralClass classByID = null;
		String query = " SELECT * FROM englishcenter.class WHERE class.status = 1 AND class.idclass=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			rs = ps.executeQuery();
			while (rs.next()) {
				classByID = new GeneralClass(rs.getInt(1), rs.getString(2),  rs.getDate(3), rs.getInt(4),
						rs.getInt(5),rs.getInt(6),rs.getInt(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return classByID;
	}
	/*insert*/
	public void insertNewClass(String className, Date startDate, int tuitionFees, int tuitionFeeSales, int courseID,int teacherID) {
		String query = "INSERT INTO `englishcenter`.`class` (`classname`, `startdate`, `tuitionfees`, `tuitionfeesales`, `idcourse`,`idteacher`,`status`) VALUES (?, ?, ?, ?, ?, ?,?);";
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
			ps.setInt(7, 1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public void insertStudentToClass(int idStudent, int idClass) {
		String query = "INSERT INTO `englishcenter.classmember` (`idclass`, `idstudent`) VALUES (?,?);";
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

	public void insertSchedule(int idClass, String times, int idWeeksday, int idClassroom) {
		String query = "INSERT INTO `englishcenter`.`schedule` (`idclass`, `times`, `idweeksday`, `idclassroom`) VALUES (?,?,?,?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			ps.setString(2, times);
			ps.setInt(3, idWeeksday);
			ps.setInt(4, idClassroom);
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
		String query = "DELETE FROM englishcenter.classmember cmember WHERE cmember.idclass=? and cmember.idstudent=?;";
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
	public int countScheduleOfClassByidClass(int idClass) {
		String query = "SELECT COUNT(idschedule) FROM englishcenter.schedule WHERE idclass=?;";
		int count = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count;
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

	public List<Schedule> getAllSchedulesByID(int idClass) {
		List<Schedule> tScheduleByID = new ArrayList<Schedule>();
		String query = "SELECT ts.idschedule,ts.times,ts.idweeksday,weeksday.weeksday_name,ts.idclassroom,classroom.classroom_name FROM englishcenter.schedule ts,englishcenter.weeksday,englishcenter.classroom\r\n"
				+ " where  ts.idclassroom=classroom.idclassroom and ts.idweeksday=weeksday.idweeksday and ts.idclass=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			rs = ps.executeQuery();
			while (rs.next()) {
				tScheduleByID.add(new Schedule(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tScheduleByID;
	}
	/*create Schedule*/
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

	public static void main(String[] args) {
		ClassDAO cDAO = new ClassDAO();
//		List<GeneralClass> cList = cDAO.getAllClass();
//		for (GeneralClass generalClass : cList) {
//			System.out.println(generalClass);
//		}
//		GeneralClass classByID =cDAO.getInfoClassByClassID(1);
//		System.out.println(classByID);
		List<Schedule> schedules = cDAO.getAllSchedulesByID(1);
		System.out.println(schedules);
		cDAO.deleteScheduleByIdSchedule(27);
		System.out.println(cDAO.countScheduleOfClassByidClass(26));
	}
	
}
