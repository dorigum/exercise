package com.multi.exercise;

import java.util.ArrayList;

public interface IExerciseService {
	ArrayList<ExerciseVO> exerciseList();
	void insertExercise(ExerciseVO DayExercise);
	void updateExercise(ExerciseVO DayExercise);
	void deleteExercise(String dayNo);
	ExerciseVO exerciseDetailView(String dayNo);
	
	
	// 음성 파일 DB 저장 테스트
	ArrayList<ExerciseVO> exerSTTList();
	void insertSTT(ExerciseVO DayExercise);
}