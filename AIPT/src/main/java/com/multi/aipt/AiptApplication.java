package com.multi.aipt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.multi.aiservice.AIRestController;
import com.multi.aiservice.APIController;

@SpringBootApplication
@ComponentScan(basePackageClasses = APIController.class)
@ComponentScan(basePackageClasses = AIRestController.class)
public class AiptApplication {

	public static void main(String[] args) {
		SpringApplication.run(AiptApplication.class, args);
	}

}
