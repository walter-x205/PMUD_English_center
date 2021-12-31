package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Classmember;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.Student;

public class CollectTuitionDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
	public List<Classmember> getAllClassmemberByIdClass(int idClass) {
		List<Classmember> classmemberList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.classmember where classmember.idclass=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idClass);
			rs = ps.executeQuery();
			while (rs.next()) {
				classmemberList.add(new Classmember(rs.getInt(1),rs.getInt(2),rs.getInt(3)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return classmemberList;
	}
	public void updateClassmember(int idStudent,int idClass, int paidTuition) {
		String query = "UPDATE `englishcenter`.`classmember` SET `paidtuition` = ? WHERE (`idclass` = ?) and (`idstudent` = ?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, paidTuition);
			ps.setInt(2, idClass);
			ps.setInt(3, idStudent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
//	public Course getInFoCourseByID(int idCourse) {
//		String query = "SELECT * FROM englishcenter.course WHERE course.idcourse=?;";
//		try {
//			connection = new ConnectDatabase().getConnection();
//			ps = connection.prepareStatement(query);
//			ps.setInt(1, idCourse);
//			rs = ps.executeQuery();
//			while (rs.next()) {
//				Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4));
//				return course;
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return null;
//	}
//	public void updateInfoCourse(String courseName, String description,int courseID,int totalLesson) {
//		String query = "UPDATE `englishcenter`.`course` SET `courseName` = ?, `description` = ?, `totallesson` =? WHERE (`idcourse` = ?);";
//		try {
//			
//			connection = new ConnectDatabase().getConnection();
//			ps = connection.prepareStatement(query);
//			ps.setString(1, courseName);
//			ps.setString(2, description);
//			ps.setInt(3,totalLesson);
//			ps.setInt(4,courseID);
//			ps.executeUpdate();
//		} catch (Exception e) {
//			e.getStackTrace();
//		}
//	}
//	public void deleteCourseByID(int idCourse) {
//		String query = "DELETE FROM englishcenter.course WHERE course.idcourse=?;";
//		try {
//			connection = new ConnectDatabase().getConnection();
//			ps = connection.prepareStatement(query);
//			ps.setInt(1, idCourse);
//			ps.executeUpdate();
//		} catch (Exception e) {
//			e.getStackTrace();
//		}
//	}
}
