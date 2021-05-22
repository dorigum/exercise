package com.multi.service;

import java.util.ArrayList;

import com.multi.model.ExerciseVO;

public interface IExerciseService {
	ArrayList<ExerciseVO> exerciseList();
	void insertExercise(ExerciseVO DayExercise);
	void updateExercise(ExerciseVO DayExercise);
	void deleteExercise(String dayNo);
	ExerciseVO exerciseDetailView(String dayNo);
}
