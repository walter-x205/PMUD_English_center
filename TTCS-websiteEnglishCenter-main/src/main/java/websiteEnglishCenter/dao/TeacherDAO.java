package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;

public class TeacherDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public List<Teacher> getAllTeachers() {
		List<Teacher> teacherList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.teacher;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				teacherList.add(new Teacher(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(9)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return teacherList;
	}

	public void insertNewTeacher(String fullName, Date birthday, String gender,String address, String phone, String email,
			 String qualification) {
		String query = "INSERT INTO `englishcenter`.`teacher` (`fullname`, `birthday`, `gender`, `address`, `phone`, `email`, `qualification`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		java.sql.Date sqlBirthDay = new java.sql.Date(birthday.getTime());
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, fullName);
			ps.setDate(2, sqlBirthDay);
			ps.setString(3, gender);
			ps.setString(4, address);
			ps.setString(5, phone);
			ps.setString(6, email);
			ps.setString(7, qualification);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
		
	}
	public Teacher getInFoTeacherByID(int idTeacher) {
		 
		String query = "SELECT * FROM englishcenter.teacher where teacher.idteacher =?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idTeacher);
			rs = ps.executeQuery();
			while (rs.next()) {
				Teacher teacher = new Teacher(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				return teacher;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
	public void updateInfoTeacher(String fullName, Date birthday, String gender, String address, String phone, String email,String qualification,
			int idTeacher) {
		String query = "UPDATE `englishcenter`.`teacher` SET `fullname` = ?, `birthday` = ?, `gender` = ?, `address` = ?, `phone` = ?, `email` = ?, `qualification` = ? WHERE (`idteacher` = ?);";
		try {
			java.sql.Date sqlBirthday = new java.sql.Date(birthday.getTime());
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, fullName);
			ps.setDate(2, sqlBirthday);
			ps.setString(3,gender);
			ps.setString(4,address);
			ps.setString(5,phone);
			ps.setString(6,email);
			ps.setString(7,qualification);
			ps.setInt(8,idTeacher);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void deleteTeacherByID(int idteacher) {
		System.out.println(idteacher);
		String query = "DELETE FROM englishcenter.teacher WHERE teacher.idteacher=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idteacher);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public int getMaxTeacherID() {
		String query = "SELECT max(teacher.idteacher) FROM englishcenter.teacher;";
		int maxID = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				maxID = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return maxID;
	}
}
