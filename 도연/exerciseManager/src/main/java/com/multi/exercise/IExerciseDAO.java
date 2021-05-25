package com.multi.exercise;

import java.util.ArrayList;

public interface IExerciseDAO {
	public ArrayList<ExerciseVO> exerciseList();
	public void insertExercise(ExerciseVO DayExercise);
	public void updateExercise(ExerciseVO DayExercise);
	public void deleteExercise(String dayNo);
	public ExerciseVO exerciseDetailView(String dayNo);
	
}
