package com.gdu.dev_springboot_demo.rest;

import com.gdu.dev_springboot_demo.dao.StudentDAO;
import com.gdu.dev_springboot_demo.entity.Student;
import com.gdu.dev_springboot_demo.service.StudentService;
import jakarta.annotation.PostConstruct;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class StudentRestController {
    private StudentService studentService ;

    public StudentRestController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/students")
    public List<Student> getStudents() {
        return studentService.findAll();
    }
    @GetMapping("/students/{id}")
    public Student getStudent(@PathVariable int id) {
        return studentService.findById(id);
    }
    @PostMapping("/students")
    public Student addStudent(@RequestBody Student student) {
        student.setId(0);
        Student newStudent = studentService.save(student);
        return newStudent;
    }
    @PutMapping("/students")
    public Student updateStudent(@RequestBody Student student) {
        Student newStudent = studentService.save(student);
        return newStudent;
    }
    @DeleteMapping("/students/{id}")
    public String deleteStudent(@PathVariable int id) {
        studentService.deleteById(id);
        return "delete success student have id= " + id;
    }
}
