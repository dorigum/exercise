package com.multi.management;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.multi.exercise.ExerciseController;
import com.multi.exercise.IExerciseDAO;
import com.multi.member.IMemberDAO;
import com.multi.member.MemberController;

@SpringBootApplication
@ComponentScan(basePackageClasses = AiController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@ComponentScan(basePackageClasses = ExerciseController.class)
@MapperScan(basePackageClasses=IMemberDAO.class)
@MapperScan(basePackageClasses=IExerciseDAO.class)
public class ExerciseManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExerciseManagerApplication.class, args);
	}

}
