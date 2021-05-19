package com.multi_project.exer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.multi_project.exer.dao.exerciseDAO;
import com.multi_project.exer.model.ExerciseVO;

@Service
public class ExerciseService implements IExerciseService {
	@Autowired
	@Qualifier("IExerciseDAO")
	exerciseDAO dao;
	
	@Override
	public ArrayList<ExerciseVO> exerciseList() {
		return dao.exerciseList();
	}

	@Override
	public void insertExercise(ExerciseVO DayExercise) {
		dao.insertExercise(DayExercise);

	}

	@Override
	public void updateExercise(ExerciseVO DayExercise) {
		dao.updateExercise(DayExercise);

	}

	@Override
	public void deleteExercise(String dayNo) {
		dao.deleteExercise(dayNo);

	}

	@Override
	public ExerciseVO exerciseDetailView(String dayNo) {
		return dao.exerciseDetailView(dayNo);
	}

}
