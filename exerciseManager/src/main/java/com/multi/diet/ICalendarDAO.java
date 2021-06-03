package com.multi.diet;

import java.util.ArrayList;

public interface ICalendarDAO {
	public ArrayList<CalendarVO> byTimeList();
	public void inserCalendar(CalendarVO intakeEvent);
}
