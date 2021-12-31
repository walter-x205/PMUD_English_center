package websiteEnglishCenter.dto;

import java.util.Date;

public class Student {
	private int idStudent;
	private String fullName;
	private Date birthday;
	private String gender;
	private String address;
	private String phone;
	private String email;
	public int getIdStudent() {
		return idStudent;
	}
	public void setIdStudent(int idStudent) {
		this.idStudent = idStudent;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Student() {
		super();
	}
	public Student(int idStudent, String fullName, Date birthday, String gender, String address, String phone,
			String email) {
		super();
		this.idStudent = idStudent;
		this.fullName = fullName;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}
	
	public Student(String fullName, Date birthday, String gender, String address, String phone, String email) {
		super();
		this.fullName = fullName;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}
	@Override
	public String toString() {
		return "Student [idStudent=" + idStudent + ", fullName=" + fullName + ", birthday=" + birthday + ", gender="
				+ gender + ", address=" + address + ", phone=" + phone + ", email=" + email + "]";
	}
	
}