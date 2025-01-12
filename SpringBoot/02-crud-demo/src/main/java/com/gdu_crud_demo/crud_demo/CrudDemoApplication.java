
package com.gdu_crud_demo.crud_demo;

import com.gdu_crud_demo.crud_demo.dao.StudentDAO;
import com.gdu_crud_demo.crud_demo.entity.Student;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import java.util.List;

@SpringBootApplication
public class CrudDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(CrudDemoApplication.class, args);
	}
	@Bean
	public CommandLineRunner commandLineRunner(StudentDAO studentDAO) {
		return args -> {
			System.out.println("Connected Database");
			CreateStudent(studentDAO);
			//System.out.println("Create Student");
			//ViewStudent(studentDAO);
			//ViewAllStudents(studentDAO);
			//ViewFirstName(studentDAO);
			//DeletedStudent(studentDAO);
			//DecletedALLStudent(studentDAO);
		};
	}
	public void ViewFirstName(StudentDAO studentDAO) {
		List<Student> students = studentDAO.findByName("Huy");
		for (Student student : students) {
			System.out.println(student);
		}
	}
	public void ViewAllStudents(StudentDAO studentDAO) {
		List<Student> students=studentDAO.findAll();
		for(Student student:students) {
			System.out.println(student);
		}
	}
	public void ViewStudent(StudentDAO studentDAO) {
		int id=1;
		Student student=studentDAO.findById(id);
		System.out.println(student);
	}
	public void CreateStudent(StudentDAO studentDAO) {
		Student student = new Student("nghia","Luc","hottocnhatllinh@gmail.com");
		studentDAO.save(student);
		Student student1 = new Student("nghia","Luc","hottocnhatllinh@gmail.com");
		studentDAO.save(student1);
		Student student2 = new Student("nghia","Luc","hottocnhatllinh@gmail.com");
		studentDAO.save(student2);
		Student student3 = new Student("nghia","Luc","hottocnhatllinh@gmail.com");
		studentDAO.save(student3);
		Student student4 = new Student("nghia","Luc","hottocnhatllinh@gmail.com");
		studentDAO.save(student4);
	}

	public void DeletedStudent(StudentDAO studentDAO) {
		int id=1;
		studentDAO.delete(id);
		System.out.println("Deleted Student");

	}
	public void DecletedALLStudent(StudentDAO studentDAO) {
		int numRows=studentDAO.deleteAll();
		System.out.println("Deleted "+numRows+" Students");
	}

}