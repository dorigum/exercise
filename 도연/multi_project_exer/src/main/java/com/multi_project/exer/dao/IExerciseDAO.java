package com.multi_project.exer.dao;

import java.util.ArrayList;

import com.multi_project.exer.model.ExerciseVO;

public interface IExerciseDAO {
	public ArrayList<ExerciseVO> exerciseList();
	public void insertExercise(ExerciseVO DayExercise);
	public void updateExercise(ExerciseVO DayExercise);
	public void deleteExercise(String dayNo);
	public ExerciseVO exerciseDetailView(String dayNo);
	
}
