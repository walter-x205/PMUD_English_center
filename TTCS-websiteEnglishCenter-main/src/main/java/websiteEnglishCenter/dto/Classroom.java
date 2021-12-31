package websiteEnglishCenter.dto;

public class Classroom {
	private int idClassroom;
	private String classroomName;
	public int getIdClassroom() {
		return idClassroom;
	}
	public void setIdClassroom(int idClassroom) {
		this.idClassroom = idClassroom;
	}
	public String getClassroomName() {
		return classroomName;
	}
	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}
	public Classroom() {
		super();
	}
	public Classroom(int idClassroom, String classroomName) {
		super();
		this.idClassroom = idClassroom;
		this.classroomName = classroomName;
	}
	@Override
	public String toString() {
		return "Classroom [idClassroom=" + idClassroom + ", classroomName=" + classroomName + "]";
	}
	
}
