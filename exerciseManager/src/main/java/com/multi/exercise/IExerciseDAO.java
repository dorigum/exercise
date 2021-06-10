package com.multi.exercise;

import java.util.ArrayList;

public interface IExerciseDAO {
	public ArrayList<ExerciseVO> exerciseList(String loginId);
	public void insertExercise(ExerciseVO DayExercise);
	public void updateExercise(ExerciseVO DayExercise);
	public void deleteExercise(String dayNo);
	public ExerciseVO exerciseDetailView(String dayNo);
	public ArrayList<ExerciseVO> byExerciseList(String loginId, int condYear, int condMonth, int condDate);
	
	
	
	// ---------------------------------------------------------------
	// 음성 파일 DB 저장 테스트중!!!!!
	//public ArrayList<ExerciseVO> exerSTTList();
	//public void insertSTT(ExerciseVO dayExercise);
	//public void updateSTT(ExerciseVO DayExercise);
	//public void deleteSTT(String dayNo);
}
