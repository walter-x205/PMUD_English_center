package websiteEnglishCenter.dto;

public class Payroll {
	private int idTeacher;
	private int idClass;
	private int numberOfTeaching;
	private int salaryUnit;
	private int totalMoney;
	private int curMonth;
	private int curyear;
	
	public int getCurMonth() {
		return curMonth;
	}
	public void setCurMonth(int curMonth) {
		this.curMonth = curMonth;
	}
	public int getCuryear() {
		return curyear;
	}
	public void setCuryear(int curyear) {
		this.curyear = curyear;
	}
	public int getIdTeacher() {
		return idTeacher;
	}
	public void setIdTeacher(int idTeacher) {
		this.idTeacher = idTeacher;
	}
	public int getIdClass() {
		return idClass;
	}
	public void setIdClass(int idClass) {
		this.idClass = idClass;
	}
	public int getNumberOfTeaching() {
		return numberOfTeaching;
	}
	public void setNumberOfTeaching(int numberOfTeaching) {
		this.numberOfTeaching = numberOfTeaching;
	}
	
	public int getSalaryUnit() {
		return salaryUnit;
	}
	public void setSalaryUnit(int salaryUnit) {
		this.salaryUnit = salaryUnit;
	}
	
	
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	public Payroll() {
		super();
	}
	
	
	
	public Payroll(int idTeacher, int idClass, int numberOfTeaching, int salaryUnit) {
		super();
		this.idTeacher = idTeacher;
		this.idClass = idClass;
		this.numberOfTeaching = numberOfTeaching;
		this.salaryUnit = salaryUnit;
	}
	public Payroll(int idTeacher, int idClass, int salaryUnit,int numberOfTeaching,  int totalMoney) {
		super();
		this.idTeacher = idTeacher;
		this.idClass = idClass;
		this.numberOfTeaching = numberOfTeaching;
		this.salaryUnit = salaryUnit;
		this.totalMoney = totalMoney;
	}
	@Override
	public String toString() {
		return "Payroll [idTeacher=" + idTeacher + ", idClass=" + idClass + ", numberOfTeaching=" + numberOfTeaching
				+ ", idsalaryUnit=" + salaryUnit + ", totalMoney=" + totalMoney
				+ ", CurMonth=" + curMonth + ", Curyear=" + curyear + "]";
	}
	
	
}
