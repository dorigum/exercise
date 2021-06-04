package com.multi.exercise;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	
	
	
	
	// ---------------------------------------------------------------
	// 음성 파일 DB 저장 테스트
	@Override
	public ArrayList<ExerciseVO> exerSTTList() {
		return dao.exerSTTList();
	}
	
	@Override
	public void insertSTT(ExerciseVO DayExercise) {
		dao.insertSTT(DayExercise);
	}
}