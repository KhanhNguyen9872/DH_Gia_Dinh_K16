package gdu.edu.studentk16.demo_221402.model;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class Config {
	
	@Bean(name="MyBean")
	//@Primary
	public Tree getTree()
	{
		return new Tree("Day la cay SAU RIENG");
	}

}
