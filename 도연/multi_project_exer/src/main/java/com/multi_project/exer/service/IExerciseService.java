package com.multi_project.exer.service;

import java.util.ArrayList;

import com.multi_project.exer.model.ExerciseVO;

public interface IExerciseService {
	ArrayList<ExerciseVO> exerciseList();
	void insertExercise(ExerciseVO DayExercise);
	void updateExercise(ExerciseVO DayExercise);
	void deleteExercise(String dayNo);
	ExerciseVO exerciseDetailView(String dayNo);
}
