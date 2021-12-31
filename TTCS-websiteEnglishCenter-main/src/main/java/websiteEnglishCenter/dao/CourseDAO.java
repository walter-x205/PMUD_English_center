package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.Student;

public class CourseDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public List<Course> getAllCourses() {
		List<Course> courseList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.course;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				courseList.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4),rs.getInt(5)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return courseList;
	}
	public List<Course> getAllCoursesByParentId(int parentId) {
		List<Course> courseList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.course where parent_id!=idcourse and parent_id=? ;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, parentId);
			rs = ps.executeQuery();
			while (rs.next()) {
				courseList.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4),rs.getInt(5)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return courseList;
	}
	public void insertNewCourse(String courseName,String description,int totalLesson) {
		String query = "INSERT INTO `englishcenter`.`course` (`courseName`, `description`,`totallesson`) VALUES ( ?, ?, ?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, courseName);
			ps.setString(2, description);
			ps.setInt(3, totalLesson);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public Course getInFoCourseByID(int idCourse) {
		String query = "SELECT * FROM englishcenter.course WHERE course.idcourse=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idCourse);
			rs = ps.executeQuery();
			while (rs.next()) {
				Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4),rs.getInt(5));
				return course;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public void updateInfoCourse(String courseName, String description,int courseID,int totalLesson) {
		String query = "UPDATE `englishcenter`.`course` SET `courseName` = ?, `description` = ?, `totallesson` =? WHERE (`idcourse` = ?);";
		try {
			
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, courseName);
			ps.setString(2, description);
			ps.setInt(3,totalLesson);
			ps.setInt(4,courseID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void deleteCourseByID(int idCourse) {
		String query = "DELETE FROM englishcenter.course WHERE course.idcourse=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idCourse);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public static void main(String[] args) {
		CourseDAO courseDAO = new CourseDAO();
//		cDao.updateInfoCourse("ok", "được luôn", 13, 30);
		List<Course> courseListByParentId = new ArrayList<Course>();
		
	}
}
