package com.gdu_springboot.springboot_demo.rest;

import com.gdu_springboot.springboot_demo.dao.StudentDAO;
import com.gdu_springboot.springboot_demo.entiy.Student;
import com.gdu_springboot.springboot_demo.service.StudentService;
import jakarta.annotation.PostConstruct;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class StudentRestController {
    private StudentService studentService;

    public StudentRestController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/students")
    public List<Student> getStudents() {
        return studentService.getAllStudents();
    }
    @GetMapping("/students/{id}")
    public Student getStudent(@PathVariable int id) {
        return studentService.getStudentById(id);
    }
    @PostMapping("/students")
    public Student ThemSinhVien(@RequestBody Student student) {
        student.setId(0);
        return studentService.addStudent(student);
    }
    @PutMapping("/students")
    public Student capNhatSinhVien(@RequestBody Student student) {
        Student student1 = studentService.addStudent(student);
        return student1;
    }
    @DeleteMapping("/students/{id}")
    public String deleteStudent(@PathVariable int id) {
        studentService.deleteStudent(id);
        return "Delete success student has id= " + id;
    }
}
