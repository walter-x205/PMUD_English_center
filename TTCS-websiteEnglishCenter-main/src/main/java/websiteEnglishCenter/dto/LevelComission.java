package websiteEnglishCenter.dto;

public class LevelComission {
	private int idLevelComission;
	private String level;
	private float percent;
	public int getIdLevelComission() {
		return idLevelComission;
	}
	public void setIdLevelComission(int idLevelComission) {
		this.idLevelComission = idLevelComission;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public float getPercent() {
		return percent;
	}
	public void setPercent(float percent) {
		this.percent = percent;
	}
	public LevelComission() {
		super();
	}
	public LevelComission(int idLevelComission, String level, float percent) {
		super();
		this.idLevelComission = idLevelComission;
		this.level = level;
		this.percent = percent;
	}
	@Override
	public String toString() {
		return "LevelComission [idLevelComission=" + idLevelComission + ", level=" + level + ", percent=" + percent
				+ "]";
	}
	
}
