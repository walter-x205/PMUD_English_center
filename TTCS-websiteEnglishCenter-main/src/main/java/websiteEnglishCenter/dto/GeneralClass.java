package websiteEnglishCenter.dto;

import java.util.Date;

public class GeneralClass {
	private int idClass;
	private String className;
	private String courseName;
	private Date startDate;
	private int tuitionFees;
	private int tuitionFeeSales;
	private int idCourse;
	private int idTeacher;
	private String teacherName;
	private int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getIdTeacher() {
		return idTeacher;
	}
	public void setIdTeacher(int idTeacher) {
		this.idTeacher = idTeacher;
	}
	public int getIdCourse() {
		return idCourse;
	}
	public void setIdCourse(int idCourse) {
		this.idCourse = idCourse;
	}
	public int getIdClass() {
		return idClass;
	}
	public void setIdClass(int idClass) {
		this.idClass = idClass;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public int getTuitionFees() {
		return tuitionFees;
	}
	public void setTuitionFees(int tuitionFees) {
		this.tuitionFees = tuitionFees;
	}
	public int getTuitionFeeSales() {
		return tuitionFeeSales;
	}
	public void setTuitionFeeSales(int tuitionFeeSales) {
		this.tuitionFeeSales = tuitionFeeSales;
	}
	public GeneralClass() {
		super();
	}

	public GeneralClass(int idClass, String className, Date startDate, int tuitionFees, int tuitionFeeSales,
			int idCourse,int idTeacher,int status) {
		super();
		this.idClass = idClass;
		this.className = className;
		this.startDate = startDate;
		this.tuitionFees = tuitionFees;
		this.tuitionFeeSales = tuitionFeeSales;
		this.idCourse = idCourse;
		this.idTeacher = idTeacher;
		this.status = status;
	}
	public GeneralClass(int idClass, String className, Date startDate, int tuitionFees, int tuitionFeeSales,
			int idCourse,int idTeacher) {
		super();
		this.idClass = idClass;
		this.className = className;
		this.startDate = startDate;
		this.tuitionFees = tuitionFees;
		this.tuitionFeeSales = tuitionFeeSales;
		this.idCourse = idCourse;
		this.idTeacher = idTeacher;
	}
	public GeneralClass(int idClass, String className, String courseName, Date startDate, int tuitionFees,
			int tuitionFeeSales) {
		super();
		this.idClass = idClass;
		this.className = className;
		this.courseName = courseName;
		this.startDate = startDate;
		this.tuitionFees = tuitionFees;
		this.tuitionFeeSales = tuitionFeeSales;

	}
	
	public GeneralClass(int idClass, String className, String courseName, Date startDate, int tuitionFees,
			int tuitionFeeSales, int idCourse) {
		super();
		this.idClass = idClass;
		this.className = className;
		this.courseName = courseName;
		this.startDate = startDate;
		this.tuitionFees = tuitionFees;
		this.tuitionFeeSales = tuitionFeeSales;
		this.idCourse = idCourse;
	}
	

	@Override
	public String toString() {
		return "GeneralClass [idClass=" + idClass + ", className=" + className + ", courseName=" + courseName
				+ ", startDate=" + startDate + ", tuitionFees=" + tuitionFees + ", tuitionFeeSales=" + tuitionFeeSales
				+ ", idCourse=" + idCourse + "]";
	}


}