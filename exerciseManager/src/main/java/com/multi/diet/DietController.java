package com.multi.diet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DietController {
	
	@Autowired
	CalendarService calendarSerive;
	
	@RequestMapping("/dietMain")
	public String viewDietMain(HttpSession session) {
		
		return "dietMain";
	}

}

