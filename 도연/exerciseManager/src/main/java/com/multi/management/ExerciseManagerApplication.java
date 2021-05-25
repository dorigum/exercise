package com.multi.management;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.multi.exercise.ExerciseController;
import com.multi.exercise.IExerciseDAO;

@SpringBootApplication
@ComponentScan(basePackageClasses = AiController.class)
@ComponentScan(basePackageClasses = ExerciseController.class)
@MapperScan(basePackageClasses=IExerciseDAO.class)
public class ExerciseManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExerciseManagerApplication.class, args);
	}

}
