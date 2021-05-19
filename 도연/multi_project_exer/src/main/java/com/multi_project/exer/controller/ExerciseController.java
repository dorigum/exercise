package com.multi_project.exer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi_project.exer.model.ExerciseVO;
import com.multi_project.exer.service.ExerciseService;

@Controller
public class ExerciseController {
	@Autowired
	ExerciseService service;
	
	// index 페이지
	@RequestMapping("/index")
	public String viewIndex() {
		return "index";
	}
	
	// 전체 운동 기록 조회
	@RequestMapping("/exer/exerciseListView")
	public String viewExerciseList(Model model) {
		ArrayList<ExerciseVO> exerciseList = service.exerciseList();
		model.addAttribute("exerciseList", exerciseList);
		return "exer/exerciseListView";
	}
	
	// 운동 기록 화면으로 이동
	@RequestMapping("/exer/exerciseNewForm")
	public String viewExerciseForm() {
		return "exer/exerciseNewForm";
	}
	
	// 운동 기록 : DB 저장
	@RequestMapping("/exer/insert")
	public String insertExercise(ExerciseVO exercise) {
		service.insertExercise(exercise);
		return "redirect:./exerciseListView";
	}
	
	// 운동 상세 기록 조회
	@RequestMapping("/exer/exerciseDetailView/{dayNo}")
	public String detailViewExercise(@PathVariable String dayNo, Model model) {
		ExerciseVO exercise = service.exerciseDetailView(dayNo);
		model.addAttribute("exercise", exercise);
		return "exer/exerciseDetailView";
	}
	
	// 운동 기록 수정화면으로 이동
	@RequestMapping("/exer/updateForm/{dayNo}")
	public String updateExerciseForm(@PathVariable String dayNo, Model model) {
		ExerciseVO exercise = service.exerciseDetailView(dayNo);
		model.addAttribute("exercise", exercise);
		return "exer/exerciseUpdateForm";
	}
	
	// 운동 기록 수정
	@RequestMapping("/exer/update")
	public String updateExercise(ExerciseVO exercise) {
		service.updateExercise(exercise);
		return "redirect:./exerciseListView";
	}
	
	// 운동 기록 삭제
	@RequestMapping("/exer/delete/{dayNo}")
	public String deleteExercise(@PathVariable String dayNo) {
		service.deleteExercise(dayNo);
		return "redirect:/exer/exerciseListView";
	}
}
