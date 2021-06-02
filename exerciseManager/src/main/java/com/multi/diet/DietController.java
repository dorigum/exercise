package com.multi.diet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DietController {

	@RequestMapping("/dietMain")
	public String viewDietMain() {
		return "dietMain";
	}

}
