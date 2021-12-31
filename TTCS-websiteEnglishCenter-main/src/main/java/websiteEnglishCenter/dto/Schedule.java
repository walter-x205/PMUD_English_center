package websiteEnglishCenter.dto;

public class Schedule {
	private int idSchedule;
	private int idClass;
	private String times;
	private int idWeeksday;
	private int idClassroom;
	private String weeksday;
	private String classroomName;
	public int getIdSchedule() {
		return idSchedule;
	}
	public void setIdSchedule(int idSchedule) {
		this.idSchedule = idSchedule;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public int getIdClass() {
		return idClass;
	}
	public void setIdClass(int idClass) {
		this.idClass = idClass;
	}
	public int getIdClassroom() {
		return idClassroom;
	}
	public void setIdClassroom(int idClassroom) {
		this.idClassroom = idClassroom;
	}
	public int getIdWeeksday() {
		return idWeeksday;
	}
	public void setIdWeeksday(int idWeeksday) {
		this.idWeeksday = idWeeksday;
	}
	
	public String getWeeksday() {
		return weeksday;
	}
	public void setWeeksday(String weeksday) {
		this.weeksday = weeksday;
	}
	public String getClassroomName() {
		return classroomName;
	}
	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}

	public Schedule(int idSchedule, int idClass, String times, int idWeeksday, int idClassroom) {
		super();
		this.idSchedule = idSchedule;
		this.idClass = idClass;
		this.times = times;
		this.idWeeksday = idWeeksday;
		this.idClassroom = idClassroom;
	}
	public Schedule() {
		super();
	}
	
	
	public Schedule(int idSchedule, String times, int idWeeksday, String weeksday, int idClassroom,
			String classroomName) {
		super();
		this.idSchedule = idSchedule;
		this.idClass = idClass;
		this.times = times;
		this.idWeeksday = idWeeksday;
		this.idClassroom = idClassroom;
		this.weeksday = weeksday;
		this.classroomName = classroomName;
	}
	@Override
	public String toString() {
		return "TeachingSchedule [idSchedule=" + idSchedule + ", idClass=" + idClass + ", times=" + times
				+ ", idWeeksday=" + idWeeksday + ", idClassroom=" + idClassroom
				+ ", weeksday=" + weeksday + ", classroomName=" + classroomName  + "]";
	}
	
	
	
	
	
}
