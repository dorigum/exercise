package com.multi.aiservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class APIController {
	@Autowired
	private STTService sttService;

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/stt")
	public String STT() {
		return "sttResult";
	}
}