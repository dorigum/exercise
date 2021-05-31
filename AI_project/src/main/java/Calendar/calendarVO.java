package Calendar;

public class calendarVO {
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getExDate() {
		return exDate;
	}
	public void setExDate(String exDate) {
		this.exDate = exDate;
	}
	public String getExName() {
		return exName;
	}
	public void setExName(String exName) {
		this.exName = exName;
	}
	public int getExTime() {
		return exTime;
	}
	public void setExTime(int exTime) {
		this.exTime = exTime;
	}
	public int getExcount() {
		return excount;
	}
	public void setExcount(int excount) {
		this.excount = excount;
	}
	public String getExcoment() {
		return excoment;
	}
	public void setExcoment(String excoment) {
		this.excoment = excoment;
	}
	private String userid;
	private String exDate;
	private String exName;
	private int exTime;
	private int excount;
	private String excoment;
}
