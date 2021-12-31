package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Attendance;

public class AttendanceDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public List<Attendance> getAttendance(int idclass) {
		String query = "SELECT * FROM englishcenter.attendance,englishcenter.schedule \r\n"
				+ "where attendance.idschedule=schedule.idschedule and schedule.idclass= ?\r\n"
				+ "ORDER BY attendance.lesson DESC,attendance.idstudent ASC ;";
		List<Attendance> aList = new ArrayList<Attendance>();
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idclass);
			rs = ps.executeQuery();
			while (rs.next()) {
				aList.add(new Attendance(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),rs.getString(7), rs.getString(8),rs.getInt(9)));
				 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return aList;
	}
	public List<Attendance> getAllAttendanceGroupBYIdSchedule() {
		String query = "SELECT * FROM englishcenter.attendance\r\n"
				+ "GROUP BY attendance.idschedule;";
		List<Attendance> aList = new ArrayList<Attendance>();
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				aList.add(new Attendance(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),rs.getString(7), rs.getString(8),rs.getInt(9)));
				 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return aList;
	}
	public List<Attendance> getAllAttendanceOfTeaacherInTimesGroupByLesson(int idTeacher,String startDate,String endDate) {
		String query = "SELECT att.idattendance,att.lesson,att.idschedule,att.idstudent,att.idteacher,att.isattendant,att.date,att.note,schedule.idclass FROM englishcenter.attendance att,englishcenter.schedule \r\n"
				+ "where att.idschedule=schedule.idschedule  and idteacher= ? and date>=? and date<=?\r\n"
				+ "GROUP BY att.lesson;";
		List<Attendance> aList = new ArrayList<Attendance>();
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idTeacher);
			ps.setString(2, startDate);
			ps.setString(3, endDate);
			rs = ps.executeQuery();
			while (rs.next()) {
				aList.add(new Attendance(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),rs.getString(7), rs.getString(8), rs.getInt(9)));
				 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return aList;
	}
	public List<Attendance> getDateOfSchedule(int idclass) {
		String query = "SELECT attendance.idattendance,attendance.lesson,attendance.idschedule, attendance.date FROM englishcenter.attendance ,englishcenter.schedule\r\n"
				+ "where attendance.idschedule=schedule.idschedule and schedule.idclass= ?\r\n"
				+ "group by attendance.lesson \r\n"
				+ "ORDER BY attendance.lesson DESC ;";
		List<Attendance> aList = new ArrayList<Attendance>();
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idclass);
			rs = ps.executeQuery();
			while (rs.next()) {
				aList.add(new Attendance(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4)));
				 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return aList;
	}
	public int countLesson(int idclass) {
		String query = "SELECT COUNT(DISTINCT attendance.date)\r\n"
				+ "FROM englishcenter.attendance,englishcenter.schedule \r\n"
				+ "where attendance.idschedule=schedule.idschedule and schedule.idclass= ?;";
		int countLesson=0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idclass);
			rs = ps.executeQuery();
			while (rs.next()) {
				countLesson = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return countLesson;
	}
	public void insertAttendanceForClass(int lesson,int idschedule,int idStudent,int idteacher,int isattendant,Date date,String note) {
		String query = "INSERT INTO `englishcenter`.`attendance` (`lesson`, `idschedule`, `idstudent`, `idteacher`, `isattendant`, `date`, `note`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, lesson);
			ps.setInt(2, idschedule);
			ps.setInt(3, idStudent);
			ps.setInt(4, idteacher);
			ps.setInt(5, isattendant);
			ps.setDate(6, sqlDate);
			ps.setString(7, note);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public int getTeachingLessonOfTeacherInClass(int idclass,int idTeacher,String startDate,String endDate) {
		String query = "SELECT COUNT(DISTINCT att.lesson) FROM englishcenter.attendance att,englishcenter.schedule \r\n"
				+ "where att.idschedule=schedule.idschedule and idclass=? and idteacher= ? and date>=? and date<=?;";
		int teachingLesson=0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idclass);
			ps.setInt(2, idTeacher);
			ps.setString(3, startDate);
			ps.setString(4, endDate);
			rs = ps.executeQuery();
			while (rs.next()) {
				teachingLesson = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return teachingLesson;
	}
	public static void main(String[] args) {
		AttendanceDAO aDao = new AttendanceDAO();
		List<Attendance> aList =aDao.getAttendance(26);
		List<Attendance> aList1 =aDao.getDateOfSchedule(26);
		for (Attendance attendance : aList1) {
			System.out.println(attendance);
		}
		List<Attendance> attendances = aDao.getAllAttendanceOfTeaacherInTimesGroupByLesson(3,"2021-10-01","2021-11-01");
		for (Attendance attendance : attendances) {
			System.out.println(attendance);
		}
	}
}
