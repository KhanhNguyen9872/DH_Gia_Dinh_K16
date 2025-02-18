package com.springboot.dev_spring_boot_demo.rest;

import com.springboot.dev_spring_boot_demo.dao.StudentDAO;
import com.springboot.dev_spring_boot_demo.entity.Student;
import com.springboot.dev_spring_boot_demo.service.StudentService;
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

        return studentService.findAll();
    }
    @GetMapping("/students/{i}")
    public Student getStudent(@PathVariable int i) {
        return studentService.findById(i);
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
        Student student = studentService.findById(id);
        studentService.deleteById(id);
        return "Student deleted id= " + id;
    }
}
