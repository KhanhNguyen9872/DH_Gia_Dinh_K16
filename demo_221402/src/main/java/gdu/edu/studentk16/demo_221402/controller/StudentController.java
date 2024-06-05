package gdu.edu.studentk16.demo_221402.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import gdu.edu.studentk16.demo_221402.model.Student;
import gdu.edu.studentk16.demo_221402.model.StudentJPA;



@RestController
public class StudentController {
	
	@Autowired
	StudentJPA jpa;
	
	@GetMapping("/liststudents")	
	public List<Student> listStudents()
	{
		
//		ArrayList<Student> arr=new ArrayList<Student>();		
//		arr.add(new Student(1, "k1601", "Nguyen Van A", "221402", "371 Nguyen Kiem"));
//		arr.add(new Student(2, "k1601", "Nguyen Van B", "221402", "371 Nguyen Kiem"));
		
		List<Student> arr=jpa.findAll();		
		return  arr;

		
	}
	
	@PostMapping("/insertStudent")
	public String insertStudent(@RequestBody Student newstudent)
	{
		try
		{
		jpa.save(newstudent);		
		return "Thêm sinh viên thành công!";
		}catch(Exception ex)
		{
		return "Có lỗi:"+ex.getMessage();
		}		
		
	}
	
	@PutMapping("/updateStudent")
	public String updateStudent(@RequestBody Student student)
	{
		try
		{
		jpa.save(student);		
		return "Sửa sinh viên thành công!";
		}catch(Exception ex)
		{
		return "Có lỗi:"+ex.getMessage();
		}		
		
	}
	@DeleteMapping("/deleteStudent/{id}")
	public String deleteStudent(@PathVariable Integer id)
	{
		try
		{
		jpa.deleteById(id);		
		return "Xóa thành công!";
		}catch(Exception ex)
		{
		return "Có lỗi:"+ex.getMessage();
		}		
	}


}
