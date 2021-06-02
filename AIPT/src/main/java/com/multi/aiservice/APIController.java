package com.multi.aiservice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class APIController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/dietMain")
	public String dietMain() {
		return "dietMain";
	}

}
