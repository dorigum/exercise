package com.multi.diet;

public class FoodVO {
    private String FCode;
    private String FName;
    private String F_category;
    private double servings;
    private double Kcal;
    private double kcal_per_100;
    
	public String getFCode() {
		return FCode;
	}
	public void setFCode(String fCode) {
		FCode = fCode;
	}
	public String getFName() {
		return FName;
	}
	public void setFName(String fName) {
		FName = fName;
	}
	public String getF_category() {
		return F_category;
	}
	public void setF_category(String f_category) {
		F_category = f_category;
	}
	public double getServings() {
		return servings;
	}
	public void setServings(double servings) {
		this.servings = servings;
	}
	public double getKcal() {
		return Kcal;
	}
	public void setKcal(double kcal) {
		Kcal = kcal;
	}
	public double getKcal_per_100() {
		return kcal_per_100;
	}
	public void setKcal_per_100(double kcal_per_100) {
		this.kcal_per_100 = kcal_per_100;
	}
    
    
}
