package com.multi.aiservice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class APIController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/simpleCalendar")
	public String simpleCalendar() {
		return "simpleCalendar";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "write";
	}
	
	@RequestMapping("/insert")
	public String insert() {
		return "insert";
	}

}
