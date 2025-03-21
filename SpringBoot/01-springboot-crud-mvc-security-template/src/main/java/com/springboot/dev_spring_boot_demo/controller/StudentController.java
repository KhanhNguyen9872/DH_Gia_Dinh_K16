package com.springboot.dev_spring_boot_demo.controller;

import com.springboot.dev_spring_boot_demo.entity.Student;
import com.springboot.dev_spring_boot_demo.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin/students")
public class StudentController {
    private StudentService studentService;
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/list-student")
    public String list(Model model) {
        List<Student> students = studentService.findAll();
        model.addAttribute("students", students);
        return "admin/students/list-student";
    }

    @GetMapping("/student-form-insert")
    public String formInsert(Model model) {
        Student student = new Student();
        model.addAttribute("student", student);
        return "admin/students/student-form-insert";
    }

    @PostMapping("/save")
    public String save(Student student) {
        studentService.save(student);
        return "redirect:/admin/students/list-student";
    }

    @GetMapping("/student-form-update")
    public String formUpdate(@RequestParam("id") int id, Model model) {
        Student student = studentService.findById(id);
        model.addAttribute("student", student);
        return "admin/students/student-form-update";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        studentService.deleteById(id);
        return "redirect:/admin/students/list-student";
    }
}
