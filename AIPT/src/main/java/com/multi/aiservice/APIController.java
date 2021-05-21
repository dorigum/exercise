package com.multi.aiservice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class APIController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/fullCalendar")
	public String fullCalendar() {
		return "fullCalendar";
	}
	
	@RequestMapping("/simpleCalendar")
	public String simpleCalendar() {
		return "simpleCalendar";
	}

}
