package com.multi.diet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.multi.member.MemberService;
import com.multi.member.MemberVO;

@RestController

public class DietRestController {
	
	@Autowired
	private OCRService ocrService;
	
	@Autowired
	private CalendarService calendarService;
	
	@Autowired
	MemberService memservice;
	
	@RequestMapping("/dietOCR")
	public NutriFactVO dietOCR(@RequestParam("uploadFile") MultipartFile file) {
		/* String result = ""; */
		NutriFactVO nfvo = new NutriFactVO();		
		
		  try {
			  String uploadPath =  "c:/ai/";
			  
			  String originalFileName = file.getOriginalFilename();  
			  
			  String filePathName = uploadPath + originalFileName;
			  File file1 = new File(filePathName);
			  
			  file.transferTo(file1);
			  
			  // result = ocrService.clovaOCRService(filePathName);
			  nfvo = ocrService.clovaOCRService(filePathName);
			  
		} catch (IOException e) {
			e.printStackTrace();
		}
		  
		return nfvo;
	}
	
	@RequestMapping("byDateDietList")
	public ArrayList<CalendarVO> viewDietListByDate(HttpServletRequest requst,
													HttpSession session,
												    @RequestParam Map<String, Object> map) {
		ArrayList<CalendarVO> dietList = null;
		
		String condId = (String)session.getAttribute("loginId");
		String condYear = (String)map.get("condYear");
		String condMonth = (String)map.get("condMonth");
		String condDate = (String)map.get("condDate");
		
		// int로 변환: int intObj = Integer.parseInt((String)map.get("ObjectObj"));
		 
		try {
			dietList = calendarService.byDateDietList(condId, condYear, condMonth, condDate);
		} catch (Exception e) {
			System.out.println("DB 불러오기 실패 :( - AIRestController.byDateDietList -");
		}
		return dietList;
	}
	
	@RequestMapping("byTimeDietList")
	public ArrayList<CalendarVO> viewDietListByTime(HttpServletRequest requst,
													@RequestParam Map<String, Object> map,
													HttpSession session) {
		ArrayList<CalendarVO> dietList = null;
		
		String condId = (String)session.getAttribute("loginId");
		String condYear = (String)map.get("condYear");
		String condMonth = (String)map.get("condMonth");
		String condDate = (String)map.get("condDate");
		String condTime = (String)map.get("condTime");
		// int로 변환: int intObj = Integer.parseInt((String)map.get("ObjectObj"));
		 
		try {
			dietList = calendarService.byTimeDietList(condId, condYear, condMonth, condDate, condTime);
		} catch (Exception e) {
			System.out.println("DB 불러오기 실패 :( - AIRestController.byTimeDietList -");
		}
		return dietList;
	}
	
	@RequestMapping("getMemberInfo")
	public MemberVO myPage(Model model, HttpServletRequest request, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		MemberVO mem = memservice.myPage(loginId);
		return mem;
	}
}
