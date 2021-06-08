package com.multi.exercise;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.multi.diet.NutriFactVO;
import com.multi.diet.OCRService;

@RestController
public class AIRestController {
	@Autowired
	ExerciseService service;
	
	@Autowired
	private STTService sttService;
	
	@RequestMapping("/clovaSTT")
	public void STT(@RequestParam("uploadFile") MultipartFile file,
					  @RequestParam("language") String language, HttpSession session) {
		ExerciseVO result = new ExerciseVO();

		try {
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
			String uploadPath = "c:/ai/";

			// 2. 원본 파일 이름
			String originalFileName = file.getOriginalFilename();

			// 3. 파일 생성
			String filePathName = uploadPath + originalFileName;
			File file1 = new File(filePathName);

			// 4. 서버로 전송
			file.transferTo(file1);

			result = sttService.clovaSpeechToText(filePathName, language, session);
			System.out.println(result.getId());
			service.insertExercise(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// --------------------------------------------
	// 음성 메시지를 텍스트로 변환
	// 음성 DB 저장 테스트!!!!!!!!!!!!!!!!
	@RequestMapping("/ExerSTT")
	public String STT2(@RequestParam("uploadFile") MultipartFile file) {
		String result = "";
		
		try {
			//1. 파일 저장 경로 설정 : 실제 서비스 되는 위치 (프로젝트 외부에 저장)
			  String uploadPath =  "c:/ai/";
			  
			  //2.원본 파일 이름
			  String originalFileName = file.getOriginalFilename();  
			  
			  //3. 파일 생성 
			  String filePathName = uploadPath + originalFileName;
			  File file1 = new File(filePathName);
			  
			  //4. 서버로 전송
			  file.transferTo(file1);
			  
			  result = sttService.clovaSpeechToText2(filePathName);
			  System.out.println(result);
			  
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
