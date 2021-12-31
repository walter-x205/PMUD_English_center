package websiteEnglishCenter.dto;

public class Tuition {
	private int idTuition;
	private int idClass;
	private int idStudent;
	private int paidTuition;
	private int arrearage;
	public int getIdTuition() {
		return idTuition;
	}
	public void setIdTuition(int idTuition) {
		this.idTuition = idTuition;
	}
	public int getIdClass() {
		return idClass;
	}
	public void setIdClass(int idClass) {
		this.idClass = idClass;
	}
	public int getIdStudent() {
		return idStudent;
	}
	public void setIdStudent(int idStudent) {
		this.idStudent = idStudent;
	}
	public int getPaidTuition() {
		return paidTuition;
	}
	public void setPaidTuition(int paidTuition) {
		this.paidTuition = paidTuition;
	}
	public int getArrearage() {
		return arrearage;
	}
	public void setArrearage(int arrearage) {
		this.arrearage = arrearage;
	}
	public Tuition(int idTuition, int idClass, int idStudent, int paidTuition, int arrearage) {
		super();
		this.idTuition = idTuition;
		this.idClass = idClass;
		this.idStudent = idStudent;
		this.paidTuition = paidTuition;
		this.arrearage = arrearage;
	}
	public Tuition() {
		super();
	}
	@Override
	public String toString() {
		return "Tuition [idTuition=" + idTuition + ", idClass=" + idClass + ", idStudent=" + idStudent
				+ ", paidTuition=" + paidTuition + ", arrearage=" + arrearage + "]";
	}
	
	
}
