package gdu.edu.studentk16.demo_221402.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Student 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	private String name;
	private String studentnumber;
	private String classnumber;
	private String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStudentnumber() {
		return studentnumber;
	}
	public void setStudentnumber(String studentnumber) {
		this.studentnumber = studentnumber;
	}
	public String getClassnumber() {
		return classnumber;
	}
	public void setClassnumber(String classnumber) {
		this.classnumber = classnumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;	
		
		
	}
	
	
	public Student() {
		super();
	}
	public Student(int id, String name, String studentnumber, String classnumber, String address) {
		super();
		this.id = id;
		this.name = name;
		this.studentnumber = studentnumber;
		this.classnumber = classnumber;
		this.address = address;
	}
	
	
	
	
	
	

}

//--------------------------------------------


