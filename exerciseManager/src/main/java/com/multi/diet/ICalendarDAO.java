package com.multi.diet;

import java.util.ArrayList;

public interface ICalendarDAO {
	public ArrayList<CalendarVO> byDateDietList(String condId, String condYear, String condMonth, String condDate);
	public ArrayList<CalendarVO> byTimeDietList(String condId, String condYear, String condMonth, String condDate, String condTime);
}