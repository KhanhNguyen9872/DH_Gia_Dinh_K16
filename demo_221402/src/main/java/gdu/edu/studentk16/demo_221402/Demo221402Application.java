package gdu.edu.studentk16.demo_221402;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import gdu.edu.studentk16.demo_221402.model.Garden;

@SpringBootApplication
public class Demo221402Application {

	public static void main(String[] args) {
		//SpringApplication.run(Demo221402Application.class, args);
		
		ConfigurableApplicationContext ctx =SpringApplication.run(Demo221402Application.class, args);
		
		//Garden garden=new Garden();
		Garden garden = ctx.getBean(Garden.class);
		
		System.out.println(garden.name);
		
		System.out.println("Garden.tree.name="+garden.tree.name);
		
		
	}

}
