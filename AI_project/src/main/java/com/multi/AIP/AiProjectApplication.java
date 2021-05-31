package com.multi.AIP;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import Calendar.APIController;

@SpringBootApplication
@ComponentScan(basePackageClasses=APIController.class)
public class AiProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(AiProjectApplication.class, args);
	}

}
