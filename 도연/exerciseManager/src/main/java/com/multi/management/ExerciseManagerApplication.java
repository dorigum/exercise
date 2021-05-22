package com.multi.management;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.multi.exercise.IMemberDAO;
import com.multi.exercise.MemberController;

@SpringBootApplication
@ComponentScan(basePackageClasses = AiController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses=IMemberDAO.class)
public class ExerciseManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExerciseManagerApplication.class, args);
	}

}
