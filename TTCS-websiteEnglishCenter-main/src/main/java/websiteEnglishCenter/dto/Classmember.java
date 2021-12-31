package websiteEnglishCenter.dto;

public class Classmember {
	private int idStudent;
	private int idClass;
	private int paidTuition;
	private int payTuition;
	private String phone;
	
	public int getPayTuition() {
		return payTuition;
	}
	public void setPayTuition(int payTuition) {
		this.payTuition = payTuition;
	}
	public int getPaidTuition() {
		return paidTuition;
	}
	public void setPaidTuition(int paidTuition) {
		this.paidTuition = paidTuition;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getIdStudent() {
		return idStudent;
	}
	public void setIdStudent(int idStudent) {
		this.idStudent = idStudent;
	}
	public int getIdClass() {
		return idClass;
	}
	public void setIdClass(int idClass) {
		this.idClass = idClass;
	}
//	public StudentClass(int idStudent, int idClass) {
//		super();
//		this.idStudent = idStudent;
//		this.idClass = idClass;
//	}
	
	public Classmember(int idStudent, int idClass, String phone) {
		super();
		this.idStudent = idStudent;
		this.idClass = idClass;
		this.phone = phone;
	}
	
	public Classmember(int idClass, int idStudent, int paidTuition) {
	super();
	this.idStudent = idStudent;
	this.idClass = idClass;
	this.paidTuition = paidTuition;
	}
	
	public Classmember(int idClass, int idStudent, int paidTuition, int payTuition) {
		super();
		this.idStudent = idStudent;
		this.idClass = idClass;
		this.paidTuition = paidTuition;
		this.payTuition = payTuition;
	}
	public Classmember() {
		super();
	}
	@Override
	public String toString() {
		return "StudentClass [idStudent=" + idStudent + ", idClass=" + idClass + ", paidTuition=" + paidTuition
				+ ", phone=" + phone + "]";
	}
	
	
	
}
