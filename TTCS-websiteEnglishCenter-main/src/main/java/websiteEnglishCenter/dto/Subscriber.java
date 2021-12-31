package websiteEnglishCenter.dto;

import java.util.Date;

public class Subscriber extends Student {
	private String question;
	private int idCourse;
	private Date rigisDate;
	private int idSubscriber;
	

	public int getIdSubscriber() {
		return idSubscriber;
	}

	public void setIdSubscriber(int idSubscriber) {
		this.idSubscriber = idSubscriber;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getIdCourse() {
		return idCourse;
	}

	public void setIdCourse(int idCourse) {
		this.idCourse = idCourse;
	}

	public Date getRigisDate() {
		return rigisDate;
	}

	public void setRigisDate(Date rigisDate) {
		this.rigisDate = rigisDate;
	}

	public Subscriber(int idSubscriber,String fullName, Date birthday, String gender, String address, String phone,
			String email, String question, Date rigisDate, int idCourse,int idStudent) {
		super(idStudent, fullName, birthday, gender, address, phone, email);
		this.question = question;
		this.idCourse = idCourse;
		this.rigisDate = rigisDate;
		this.idSubscriber = idSubscriber;
	}
	public Subscriber(int idSubscriber,String fullName, Date birthday, String gender, String address, String phone,
			String email, String question, Date rigisDate, int idCourse) {
		super(fullName, birthday, gender, address, phone, email);
		this.question = question;
		this.idCourse = idCourse;
		this.rigisDate = rigisDate;
		this.idSubscriber = idSubscriber;
	}

	public Subscriber() {
		super();
	}

	@Override
	public String toString() {
		return "Subscriber [question=" + question + ", idCourse=" + idCourse + ", rigisDate=" + rigisDate
				+ ", idSubscriber=" + idSubscriber + ", getIdStudent()=" + getIdStudent() + ", getFullName()="
				+ getFullName() + ", getBirthday()=" + getBirthday() + ", getGender()=" + getGender()
				+ ", getAddress()=" + getAddress() + ", getPhone()=" + getPhone() + ", getEmail()=" + getEmail() + "]";
	}

	

	
	
	
	
}
