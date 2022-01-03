package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.GeneralClass;
import websiteEnglishCenter.dto.Classroom;
import websiteEnglishCenter.dto.Course;
import websiteEnglishCenter.dto.DayOfWeeks;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;
import websiteEnglishCenter.dto.Schedule;

public class StudentDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	
	public List<Student> getAllStudents() {
		List<Student> studentList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.student ORDER BY idstudent DESC;";
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
	public void insertNewStudent(String fullname, Date birthday,String gender,String phone,String email, String address) {
		String query = "INSERT INTO `englishcenter`.`student` (`fullname`, `birthday`, `gender`, `address`, `phone`, `email`) VALUES (?, ?, ?, ?, ?, ?);";
		java.sql.Date sqlBirthDay = new java.sql.Date(birthday.getTime());
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, fullname);
			ps.setDate(2, sqlBirthDay);
			ps.setString(3, gender);
			ps.setString(4, address);
			ps.setString(5, phone);
			ps.setString(6, email);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
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
	public Student getInFoStudentByID(int idStudent) {
		 
		String query = "SELECT * FROM englishcenter.student where student.idStudent =?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idStudent);
			rs = ps.executeQuery();
			while (rs.next()) {
				Student st =new Student(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				return st;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
	public Student getInFoStudentByPhone(String phone) {
		 
		String query = "SELECT * FROM englishcenter.student where student.phone =?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			while (rs.next()) {
				Student st =new Student(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				return st;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
	public void updateInfoStudent(String fullName, Date birthday, String gender, String address, String phone, String email,
			int idStudent) {
		String query = "UPDATE `englishcenter`.`student` SET `fullname` = ?, `birthday` = ?, `gender` = ?, `address` = ?, `phone` = ?, `email` = ? WHERE (`idstudent` = ?);";
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
			ps.setInt(7,idStudent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void deleteStudentByID(int idStudent) {
		String query = "DELETE FROM englishcenter.student WHERE student.idstudent=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idStudent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public int getMaxStudentID() {
		String query = "SELECT max(student.idstudent) FROM englishcenter.student;";
		int maxStudentID = 0;
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				maxStudentID = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return maxStudentID;
	}
	public static void main(String[] args) throws ParseException {
		StudentDAO dao = new StudentDAO();

//		List<Student> studentList = dao.getAllStudents();
//		for (Student o : studentList) {
//			System.out.println(o);
//		}
//		
//		List<Student> studentListOfClass = dao.getAllStudentsByClassID("1");
//		for (Student student : studentListOfClass) {
//			System.out.println(student);
//		}

//		
	}
}
