package websiteEnglishCenter.dto;

import java.util.Date;

public class Account {
	private int idAccount;
	private int idUser;
	private String username;
	private String password;
	private int isStudent;
	private int isTeacher;
	private int isStaff;
	private String fullname;
	private String phone;
	private String email;
	private String address;
	private Date birthday;
	private String gender;
	private String photo;
	private int idPosition;
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getIdAccount() {
		return idAccount;
	}
	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}
	public int getIsStudent() {
		return isStudent;
	}
	public void setIsStudent(int isStudent) {
		this.isStudent = isStudent;
	}
	public int getIsTeacher() {
		return isTeacher;
	}
	public void setIsTeacher(int isTeacher) {
		this.isTeacher = isTeacher;
	}
	
	public int getIsStaff() {
		return isStaff;
	}
	public void setIsStaff(int isStaff) {
		this.isStaff = isStaff;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public Account() {
		super();
	}
	public Account(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public Account(int idAccount, int idUser, String username, String password, int isStudent, int isTeacher,
			int isStaff) {
		super();
		this.idAccount = idAccount;
		this.idUser = idUser;
		this.username = username;
		this.password = password;
		this.isStudent = isStudent;
		this.isTeacher = isTeacher;
		this.isStaff = isStaff;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getIdPosition() {
		return idPosition;
	}
	public void setIdPosition(int idPosition) {
		this.idPosition = idPosition;
	}
	public Account(int idAccount, int idUser, String username, String password, int isStudent, int isTeacher,
			int isStaff, String fullname,Date birthday,  String gender, String address,
			String phone, String email, int idPosition) {
		super();
		this.idAccount = idAccount;
		this.idUser = idUser;
		this.username = username;
		this.password = password;
		this.isStaff = isStaff;
		this.fullname = fullname;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender;
		this.idPosition = idPosition;
	}
	public Account(int idAccount, int idUser, String username, String password, int isStudent, int isTeacher,
			int isStaff, String fullname,Date birthday,  String gender, String address,
			String phone, String email) {
		super();
		this.idAccount = idAccount;
		this.idUser = idUser;
		this.username = username;
		this.password = password;
		this.isStudent = isStudent;
		this.fullname = fullname;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender;
	}
	public Account(int idAccount, int idUser, String username, String password, int isTeacher, String fullname,Date birthday,  String gender, String address,
			String phone, String email) {
		super();
		this.idAccount = idAccount;
		this.idUser = idUser;
		this.username = username;
		this.password = password;
		this.isTeacher = isTeacher;
		this.fullname = fullname;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender;
	}
//	public Account(int idAccount, int idUser, String username, String password, int isTeacher, String fullname,
//			String phone, String email, String address, Date birthday, String gender) {
//		super();
//		this.idAccount = idAccount;
//		this.idUser = idUser;
//		this.username = username;
//		this.password = password;
//		this.isTeacher = isTeacher;
//		this.fullname = fullname;
//		this.phone = phone;
//		this.email = email;
//		this.address = address;
//		this.birthday = birthday;
//		this.gender = gender;
//	}
	@Override
	public String toString() {
		return "Account [idAccount=" + idAccount + ", idUser=" + idUser + ", username=" + username + ", password="
				+ password + ", isStudent=" + isStudent + ", isTeacher=" + isTeacher + ", isStaff=" + isStaff
				+ ", fullname=" + fullname + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", birthday=" + birthday + ", gender=" + gender + ", photo=" + photo + ", idPosition=" + idPosition
				+ "]";
	}
	
	
}
