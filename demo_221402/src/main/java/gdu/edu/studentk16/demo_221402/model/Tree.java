package gdu.edu.studentk16.demo_221402.model;

import org.springframework.stereotype.Component;

@Component
public class Tree 
{
	
	public String name;
	public String description;
	public String size;
	
	public Tree() {
		
		super();
		this.name="Day la cay oi";
		this.description="Mo ta ve cay oi";
	}

	public Tree(String name) {
		super();
		this.name = name;
		this.description="Mo ta ve "+this.name;
	}

}
