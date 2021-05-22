package com.multi.dao;

import java.util.ArrayList;

import com.multi.model.ExerciseVO;


public interface IExerciseDAO {
	public ArrayList<ExerciseVO> exerciseList();
	public void insertExercise(ExerciseVO DayExercise);
	public void updateExercise(ExerciseVO DayExercise);
	public void deleteExercise(String dayNo);
	public ExerciseVO exerciseDetailView(String dayNo);
	
}
