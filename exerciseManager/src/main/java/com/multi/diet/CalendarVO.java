package com.multi.diet;

public class CalendarVO {
	private String id;
	private String FCode;  // "D000009" 형식
	private String eYear;
	private String eMonth;
	private String eDate;
	private double eAmt;
	private String eTime;  // "아침", "점심", "저녁", "야식", "간식" 중 하나
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFCode() {
		return FCode;
	}
	public void setFCode(String fCode) {
		FCode = fCode;
	}
	public String geteYear() {
		return eYear;
	}
	public void seteYear(String eYear) {
		this.eYear = eYear;
	}
	public String geteMonth() {
		return eMonth;
	}
	public void seteMonth(String eMonth) {
		this.eMonth = eMonth;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public double geteAmt() {
		return eAmt;
	}
	public void seteAmt(double eAmt) {
		this.eAmt = eAmt;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	
	
}