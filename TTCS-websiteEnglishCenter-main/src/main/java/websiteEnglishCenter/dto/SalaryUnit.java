package websiteEnglishCenter.dto;

public class SalaryUnit {
	private int idSalary;
	private int idCourse;
	private int salary;
	public int getIdSalary() {
		return idSalary;
	}
	public void setIdSalary(int idSalary) {
		this.idSalary = idSalary;
	}
	public int getIdCourse() {
		return idCourse;
	}
	public void setIdCourse(int idCourse) {
		this.idCourse = idCourse;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public SalaryUnit(int idSalary, int idCourse, int salary) {
		super();
		this.idSalary = idSalary;
		this.idCourse = idCourse;
		this.salary = salary;
	}
	public SalaryUnit() {
		super();
	}
	@Override
	public String toString() {
		return "SalaryUnit [idSalary=" + idSalary + ", idCourse=" + idCourse + ", salary=" + salary + "]";
	}
	
}
