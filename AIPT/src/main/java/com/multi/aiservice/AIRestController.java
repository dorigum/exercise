package com.multi.aiservice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController  // view 페이지 없이 바로 전송 가능
public class AIRestController {
	@Autowired
	private OCRService ocrService;
	
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
			  System.out.println(nfvo);
			  
		} catch (IOException e) {
			e.printStackTrace();
		}
		  
		return nfvo;
	}

}
