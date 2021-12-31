package websiteEnglishCenter.dto;

import java.util.Date;

public class Teacher {
	private int teacherID;
	private String fullName;
	private Date birthday;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private String photo;
	private String qualification;
	public int getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(int teacherID) {
		this.teacherID = teacherID;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public Teacher() {
		super();
	}
	
	public Teacher(int teacherID, String fullName, Date birthday, String gender, String address, String phone,
			String email, String qualification) {
		super();
		this.teacherID = teacherID;
		this.fullName = fullName;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.qualification = qualification;
	}
	
	public Teacher(int teacherID, String fullName, Date birthday, String gender, String address, String phone,
			String email, String photo, String qualification) {
		super();
		this.teacherID = teacherID;
		this.fullName = fullName;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.photo = photo;
		this.qualification = qualification;
	}
	@Override
	public String toString() {
		return "Teacher [teacherID=" + teacherID + ", fullName=" + fullName + ", birthday=" + birthday + ", gender="
				+ gender + ", address=" + address + ", phone=" + phone + ", email=" + email + ", photo=" + photo
				+ ", qualification=" + qualification + "]";
	}
	
}