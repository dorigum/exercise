package com.multi.management;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.exercise.MemberService;

@Controller
public class AiController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	
}
