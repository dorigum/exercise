package com.multi.exercise;

import java.util.ArrayList;

public interface IExerciseDAO {
	public ArrayList<ExerciseVO> exerciseList();
	public void insertExercise(ExerciseVO DayExercise);
	public void updateExercise(ExerciseVO DayExercise);
	public void deleteExercise(String dayNo);
	public ExerciseVO exerciseDetailView(String dayNo);
	
	
	// 음성 녹음 저장 테스트중!!!!!
	public ArrayList<ExerVoiceVO> exerVoiceList();
	public void insertVoice(ExerVoiceVO dayExercise);
	public void updateVoice(ExerVoiceVO DayExercise);
	public void deleteVoice(String dayNo);
}
