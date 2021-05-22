package com.multi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.multi.dao.IExerciseDAO;
import com.multi.model.ExerciseVO;

@Service
public class ExerciseService implements IExerciseService {
	@Autowired
	@Qualifier("IExerciseDAO")
	IExerciseDAO dao;
	
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
