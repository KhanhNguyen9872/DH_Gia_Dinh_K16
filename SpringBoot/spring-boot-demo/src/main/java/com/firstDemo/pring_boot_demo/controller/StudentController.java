package com.firstDemo.pring_boot_demo.controller;

import com.firstDemo.pring_boot_demo.model.Student;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Date;

@Controller
public class StudentController {
    @GetMapping("/student-form")
    public String xinChao(@ModelAttribute("student") Student student){
        student = new Student();
        return "student-form";
    }

    @GetMapping("/processStudentForm")
    public String processStudentForm(@ModelAttribute("student") Student student){
        return "processStudentForm";
    }
}