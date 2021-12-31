package websiteEnglishCenter.dto;

import java.util.Date;

public class Staff {
	private int idStaff;
	private String fullName;
	private Date birthday;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private int idPosition;
	public int getIdStaff() {
		return idStaff;
	}
	public void setIdStaff(int idStaff) {
		this.idStaff = idStaff;
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
	public int getIdPosition() {
		return idPosition;
	}
	public void setIdPosition(int idPosition) {
		this.idPosition = idPosition;
	}
	public Staff() {
		super();
	}
	public Staff(int idStaff, String fullName, Date birthday, String gender, String address, String phone, String email,
			int idPosition) {
		super();
		this.idStaff = idStaff;
		this.fullName = fullName;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.idPosition = idPosition;
	}
	@Override
	public String toString() {
		return "Staff [idStaff=" + idStaff + ", fullName=" + fullName + ", birthday=" + birthday + ", gender=" + gender
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", idPosition=" + idPosition + "]";
	}
	
	
}