package com.multi.diet;

import java.util.ArrayList;
import java.util.List;

public interface ICalendarDAO {
	public ArrayList<CalendarVO> byDateDietList(String condId, String condYear, String condMonth, String condDate);
	public ArrayList<CalendarVO> byTimeDietList(String condId, String condYear, String condMonth, String condDate, String condTime);
	public void insertFoodVO(FoodVO foodVo);
	public void insertCalendarVO(CalendarVO calVo);
	public void deleteCalendarVO(String calCode);

	public List<FoodVO> bySearchList(String search_option, String keyword) throws Exception;
	
}