package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Account;
import websiteEnglishCenter.dto.Admin;
import websiteEnglishCenter.dto.Staff;
import websiteEnglishCenter.dto.StaffPosition;
import websiteEnglishCenter.dto.Student;
import websiteEnglishCenter.dto.Teacher;

public class AccountDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public Account getAccountByUsername(String username,String password) {
		String query = "SELECT * FROM englishcenter.account_user acc WHERE acc.username = ? AND acc.password = ?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
//	public Account getAccountByEmail(String username,String password) {
//		String query = "SELECT * FROM englishcenter.account_user acc WHERE acc.email = ? AND acc.password = ?;";
//		try {
//			connection = new ConnectDatabase().getConnection();
//			ps = connection.prepareStatement(query);
//			ps.setString(1, username);
//			ps.setString(2, password);
//			rs = ps.executeQuery();
//			while (rs.next()) {
//				return new Account(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7));
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return null;
//	}
	public Account checkExistUsername(String username) {
		String query = "SELECT * FROM englishcenter.account_user acc WHERE acc.username = ?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public List<Staff> getAllStaffs() {
		List<Staff> staffList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.staff;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				staffList.add(new Staff(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staffList;
	}
	public int getMaxStaffID() {
		String query = "SELECT max(staff.idstaff) FROM englishcenter.staff;";
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
	public void insertNewStaff(String fullname, Date birthday,String gender,String phone,String email, String address, int idPosition) {
		String query = "INSERT INTO `englishcenter`.`staff` (`fullname`, `birthday`, `gender`, `address`, `phone`, `email`,`idposition`) VALUES (?, ?, ?, ?, ?, ?,?);";
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
			ps.setInt(7, idPosition);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void insertAccountStaff(int idStaff, String username, String password, int idType) {
		String accountType = "ADMIN";
		if (idType == 2) {
			accountType = "STAFF";
		}
		System.out.println(idStaff+ " "+username+" "+password+" "+accountType);
		String query ="INSERT INTO `englishcenter`.`account_user` (`iduser`, `username`, `password`, `account_type`) VALUES (?, ?, ?, ?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idStaff);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.setString(4,	accountType);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void insertAccountStudent(int idStudent, String username, String password ) {
		System.out.println(idStudent+ " "+username+" "+password);
		String query ="INSERT INTO `englishcenter`.`account_user` (`iduser`, `username`, `password`, `isstudent`) VALUES (?, ?, ?, '1');";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idStudent);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void insertAccountTeacher(int idTeacher, String username, String password ) {
		System.out.println(idTeacher+ " "+username+" "+password);
		String query ="INSERT INTO `englishcenter`.`account_user` (`iduser`, `username`, `password`, `isteacher`) VALUES (?, ?, ?, '1');";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idTeacher);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public Account getInFoByAccountId(int idAccount) {
		 
		String query = "SELECT * FROM englishcenter.account_user where account_user.idaccount =?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idAccount);
			rs = ps.executeQuery();
			while (rs.next()) {
				Account account =new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5),rs.getInt(6),rs.getInt(7));
				return account;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
	public Staff getInFoByStaff(int idStaff) {
		 
		String query = "SELECT * FROM englishcenter.staff where staff.idstaff =?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idStaff);
			rs = ps.executeQuery();
			while (rs.next()) {
				Staff staff =new Staff(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getInt(8));
				return staff;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
	public void deleteAccountByID(int idAccount) {
		String query = "DELETE FROM englishcenter.account_user WHERE account_user.idaccount=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idAccount);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public void deleteStafffByID(int idStaff) {
		String query = "DELETE FROM englishcenter.staff WHERE staff.idstaff=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idStaff);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public List<Account> getAllAccount() {
		List<Account> accountList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.account_user;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				accountList.add(new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return accountList;
	}
	public List<Account> getAllAccountStaff() {
		List<Account> accountList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.account_user,englishcenter.staff where (account_type='ADMIN' or account_type = 'STAFF') and account_user.iduser=staff.idstaff;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Account account = new Account();
				account.setIdAccount(rs.getInt(1));
				account.setIdUser(rs.getInt(2));
				account.setUsername(rs.getString(3));
				account.setPassword(rs.getString(4));
				account.setAccountType(rs.getString(5));
				account.setFullname(rs.getString(7));
				account.setBirthday(rs.getDate(8));
				account.setPhone(rs.getString(11));
				account.setEmail(rs.getString(12));
				accountList.add(account);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return accountList;
	}
	public List<Account> getAllAccountTeacher() {
		List<Account> accountList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.account_user,englishcenter.teacher where account_type = 'TEACHER' and account_user.iduser=teacher.idteacher;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Account account = new Account();
				account.setIdAccount(rs.getInt(1));
				account.setIdUser(rs.getInt(2));
				account.setUsername(rs.getString(3));
				account.setPassword(rs.getString(4));
				account.setAccountType(rs.getString(5));
				account.setFullname(rs.getString(7));
				account.setBirthday(rs.getDate(8));
				account.setPhone(rs.getString(11));
				account.setEmail(rs.getString(12));
				accountList.add(account);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return accountList;
	}
	public List<Account> getAllAccountStudent() {
		List<Account> accountList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.account_user,englishcenter.student where account_type = 'STUDENT' and account_user.iduser=student.idstudent;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Account account = new Account();
				account.setIdAccount(rs.getInt(1));
				account.setIdUser(rs.getInt(2));
				account.setUsername(rs.getString(3));
				account.setPassword(rs.getString(4));
				account.setAccountType(rs.getString(5));
				account.setFullname(rs.getString(7));
				account.setBirthday(rs.getDate(8));
				account.setPhone(rs.getString(11));
				account.setEmail(rs.getString(12));
				accountList.add(account);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return accountList;
	}
	public List<StaffPosition> getAllAccountStaffPosition() {
		List<StaffPosition> staffPositionList = new ArrayList<>();
		String query = "SELECT * FROM englishcenter.staff_position;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				staffPositionList.add(new StaffPosition(rs.getInt(1),rs.getString(2)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staffPositionList;
	}
	public static void main(String[] args) {
		System.out.println();
	}
	
	public Admin adminSignIn(String user, String pass) {
		Admin login = null;
		String query ="SELECT * \n"
				+ "FROM\n"
				+ "(\n"
				+ "(SELECT * \n"
				+ "FROM englishcenter.account_user a, englishcenter.staff b\n"
				+ "WHERE \n"
				+ "a.iduser = b.idstaff and\n"
				+ "(account_type = 'ADMIN' or account_type = 'STAFF'))\n"
				+ "UNION\n"
				+ "(SELECT * \n"
				+ "FROM englishcenter.account_user a, englishcenter.teacher c\n"
				+ "WHERE \n"
				+ "a.iduser = c.idteacher and\n"
				+ "account_type = 'TEACHER')) acc\n"
				+ "WHERE acc.username = ? and acc.password = ?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while (rs.next()) {
				login = new Admin(rs.getInt(1), rs.getString(13), rs.getString(7), rs.getString(3), rs.getString(4), rs.getString(12), rs.getString(11), rs.getString(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return login;
	}
}
