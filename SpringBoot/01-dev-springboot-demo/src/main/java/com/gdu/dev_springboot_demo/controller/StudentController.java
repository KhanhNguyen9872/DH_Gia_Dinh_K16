package com.gdu.dev_springboot_demo.controller;

import com.gdu.dev_springboot_demo.model.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class StudentController {
    @GetMapping("/student-form")
    public String studentForm(@ModelAttribute("student") Student student) {
        student = new Student();
        return "student-form";
    }
    @PostMapping("/processStudentForm")
    public String processStudentForm(@ModelAttribute Student student) {
        System.out.println(student.getLastName() + " " + student.getFirstName());
        return "processStudentForm";
    }
}
