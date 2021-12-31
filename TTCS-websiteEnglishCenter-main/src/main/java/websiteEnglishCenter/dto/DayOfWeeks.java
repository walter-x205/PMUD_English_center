package websiteEnglishCenter.dto;

public class DayOfWeeks {
	private int idWeeksday;
	private String weeksday;
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
	public DayOfWeeks() {
		super();
	}
	public DayOfWeeks(int idWeeksday, String weeksday) {
		super();
		this.idWeeksday = idWeeksday;
		this.weeksday = weeksday;
	}
	@Override
	public String toString() {
		return "DayOfWeeks [idWeeksday=" + idWeeksday + ", weeksdayName=" + weeksday + "]";
	}
	
}
