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
import websiteEnglishCenter.dto.Subscriber;
import websiteEnglishCenter.dto.Teacher;
import websiteEnglishCenter.dto.Schedule;

public class SubscriberDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public List<Subscriber> getAllSubscribersByIdCourse(int idCourse) {
		List<Subscriber> subscriberList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.register_student rs where rs.idcourse = ?;";
//		System.out.println(query+idCourse);
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idCourse);
			rs = ps.executeQuery();
			while (rs.next()) {
				subscriberList.add(new Subscriber(rs.getInt(1),rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getInt(10)));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return subscriberList;
	}
	public void insertNewSubsctiber(String fullname, Date birthday,String gender , String address,String phone,String email,String question, Date regisday, int idCourse) {
		System.out.println(fullname+" "+birthday+" "+gender+" "+phone+" "+email+" "+address+" "+question+" "+idCourse);
		String query = "INSERT INTO `englishcenter`.`register_student` (`fullname`, `birthday`, `gender`, `address`, `phone`, `email`, `question`,`registerday`, `idcourse`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		java.sql.Date sqlBirthDay = new java.sql.Date(birthday.getTime());
		java.sql.Date sqlRegisterDay = new java.sql.Date(regisday.getTime());
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, fullname);
			ps.setDate(2, sqlBirthDay);
			ps.setString(3, gender);
			ps.setString(4, address);
			ps.setString(5, phone);
			ps.setString(6, email);
			ps.setString(7, question);
			ps.setDate(8, sqlRegisterDay);
			ps.setInt(9, idCourse);
//			ps.setInt(10, idStudent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void deleteSubcriberByID(int idSubcriber) {
		String query = "DELETE FROM `englishcenter`.`register_student` WHERE (`id` = ?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idSubcriber);
			ps.executeUpdate();
			System.out.println(query+" "+idSubcriber);
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
//	public void insertNewSubsctiber(String fullname, Date birthday,String gender , String address,String phone,String email,String question, Date regisday, int idCourse,Integer idStudent) {
//		System.out.println(fullname+" "+birthday+" "+gender+" "+phone+" "+email+" "+address+" "+question+" "+idCourse+" "+idStudent);
//		String query = "INSERT INTO `englishcenter`.`register_student` (`fullname`, `birthday`, `gender`, `address`, `phone`, `email`, `question`,`registerday`, `idcourse`, `idstudent`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
//		java.sql.Date sqlBirthDay = new java.sql.Date(birthday.getTime());
//		java.sql.Date sqlRegisterDay = new java.sql.Date(regisday.getTime());
//		try {
//			connection = new ConnectDatabase().getConnection();
//			ps = connection.prepareStatement(query);
//			ps.setString(1, fullname);
//			ps.setDate(2, sqlBirthDay);
//			ps.setString(3, gender);
//			ps.setString(4, address);
//			ps.setString(5, phone);
//			ps.setString(6, email);
//			ps.setString(7, question);
//			ps.setDate(8, sqlRegisterDay);
//			ps.setInt(9, idCourse);
//			ps.setInt(10, idStudent);
//			ps.executeUpdate();
//		} catch (Exception e) {
//			e.getStackTrace();
//		}
//	}
	
	public Subscriber getInFoSubscriberByPhone(String phone) {
		 
		String query = "SELECT * FROM englishcenter.register_student rs where rs.phone =?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			while (rs.next()) {
				Subscriber subscriber =new Subscriber(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4)
						, rs.getString(5),rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getInt(10));
				return subscriber;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}

	public static void main(String[] args) throws ParseException {
		SubscriberDAO dao = new SubscriberDAO();
//		List<Subscriber> sub =dao.getAllSubscribersByIdCourse(1);
		Subscriber sub2 =dao.getInFoSubscriberByPhone("03697541");
		System.out.println(sub2);
//		for (Subscriber subscriber : sub) {
//			System.out.println(subscriber);
//		}
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
