package websiteEnglishCenter.dto;

import java.util.Date;

public class Attendance {
	private int idAttendance;
	private int numberOfLesson;
	private int idSchedule;
	private int idStudent;
	private int idTeacher;
	private int isAttendant;
	private int idClass;
	private String date;
	private String note;
	

	public int getIdClass() {
		return idClass;
	}
	public void setIdClass(int idClass) {
		this.idClass = idClass;
	}
	public int getNumberOfLesson() {
		return numberOfLesson;
	}
	public void setNumberOfLesson(int numberOfLesson) {
		this.numberOfLesson = numberOfLesson;
	}
	public int getIdAttendance() {
		return idAttendance;
	}
	public void setIdAttendance(int idAttendance) {
		this.idAttendance = idAttendance;
	}
	public int getIdSchedule() {
		return idSchedule;
	}
	public void setIdSchedule(int idSchedule) {
		this.idSchedule = idSchedule;
	}
	public int getIdStudent() {
		return idStudent;
	}
	public void setIdStudent(int idStudent) {
		this.idStudent = idStudent;
	}
	public int getIdTeacher() {
		return idTeacher;
	}
	public void setIdTeacher(int idTeacher) {
		this.idTeacher = idTeacher;
	}
	public int getIsAttendant() {
		return isAttendant;
	}
	public void setIsAttendant(int isAttendant) {
		this.isAttendant = isAttendant;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Attendance() {
		super();
	}
	
	
	public Attendance(int idAttendance, int numberOfLesson, int idSchedule, int idStudent, int idTeacher,
			int isAttendant, String date, String note, int idClass) {
		super();
		this.idAttendance = idAttendance;
		this.numberOfLesson = numberOfLesson;
		this.idSchedule = idSchedule;
		this.idStudent = idStudent;
		this.idTeacher = idTeacher;
		this.isAttendant = isAttendant;
		this.date = date;
		this.note = note;
		this.idClass = idClass;
	}
	public Attendance(int idAttendance, int numberOfLesson,int idSchedule, String date) {
		super();
		this.idAttendance = idAttendance;
		this.numberOfLesson = numberOfLesson;
		this.idSchedule = idSchedule;
		this.date = date;
	}
	@Override
	public String toString() {
		return "Attendance [idAttendance=" + idAttendance + ", numberOfLesson=" + numberOfLesson + ", idSchedule="
				+ idSchedule + ", idStudent=" + idStudent + ", idTeacher=" + idTeacher + ", isAttendant=" + isAttendant
				+ ", idClass=" + idClass + ", date=" + date + ", note=" + note + "]";
	}
	
	
	
	
}
