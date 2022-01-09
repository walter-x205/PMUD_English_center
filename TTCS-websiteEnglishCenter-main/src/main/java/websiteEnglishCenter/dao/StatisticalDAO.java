package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import websiteEnglishCenter.connectDB.ConnectDatabase;

public class StatisticalDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public int countAllClass() {
		String query = "SELECT COUNT(idclass) FROM englishcenter.class;";
		int countAllClass = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				countAllClass = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return countAllClass;
	}
	public int countAllCourse() {
		String query = "SELECT COUNT(idcourse) FROM englishcenter.course;";
		int countAllCourse = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				countAllCourse = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return countAllCourse;
	}
	public int countAllStudent() {
		String query = "SELECT COUNT(idstudent) FROM englishcenter.student;";
		int countAllStudent = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				countAllStudent = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return countAllStudent;
	}
	public int countAllTeacher() {
		String query = "SELECT COUNT(idteacher) FROM englishcenter.teacher;";
		int countAllTeacher = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				countAllTeacher = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return countAllTeacher;
	}
}
