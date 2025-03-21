package com.springboot.dev_spring_boot_demo.controller;

import com.springboot.dev_spring_boot_demo.entity.Student;
import com.springboot.dev_spring_boot_demo.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {
    private StudentService studentService;
    public HomeController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/shop")
        public String shop(Model model) {
        List<Student> students = studentService.findAll();
            model.addAttribute("students", students);
            System.out.println(students);
            return "shop";
        }

    @GetMapping("/user-detail")
    public String userDetail(@RequestParam("id") int id, Model model) {
        Student student = studentService.findById(id);
        model.addAttribute("student", student);
        return "userDetail";
    }

        @GetMapping("/about")
    public String about() {
        return "about";
        }

        @GetMapping("/services")
    public String services() {
        return "services";
        }

        @GetMapping("/blog")
    public String blog() {
        return "blog";
        }

        @GetMapping("/contact")
    public String contact() {
        return "contact";
        }


}
