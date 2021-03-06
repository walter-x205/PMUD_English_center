package websiteEnglishCenter.dto;

public class Course {
	private int courseID;
	private String courseName;
	private String description;
	private int totalLesson;
	private int parentId;
	private boolean status;
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Course() {
		super();
	}
	
	public int getTotalLesson() {
		return totalLesson;
	}
	public void setTotalLesson(int totalLesson) {
		this.totalLesson = totalLesson;
	}
	
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	/**
	 * @return the status
	 */
	public boolean isStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Course(int courseID, String courseName, String description) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.description = description;
	}
	
	public Course(int courseID, String courseName) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
	}
	
	public Course(int courseID, String courseName, String description, int totalLesson, int parentId) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.description = description;
		this.totalLesson = totalLesson;
		this.parentId = parentId;
	}
	public Course(int courseID, String courseName, String description, int totalLesson, int parentId, boolean status) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.description = description;
		this.totalLesson = totalLesson;
		this.parentId = parentId;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Course [courseID=" + courseID + ", courseName=" + courseName + ", description=" + description
				+ ", totalLesson=" + totalLesson + ", parentId=" + parentId + ", status=" + status + "]";
	}
	
	
}
