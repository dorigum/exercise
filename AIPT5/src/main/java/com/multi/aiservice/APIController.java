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
	
	@RequestMapping("/content")
	public String content() {
		return "content";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		return "delete";
	}
	
	@RequestMapping("/redirect")
	public String redirect() {
		return "redirect";
	}
	
}
