package com.gdu_springboot.dev_springboot.rest;

import com.gdu_springboot.dev_springboot.entity.Student;
import jakarta.annotation.PostConstruct;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class StudentRestController {
    private List<Student> students;

    @PostConstruct
    public void init() {
        students = new ArrayList<>();
        students.add(new Student(1, "Truong", "Tran", "truongtran@gmail.com"));
        students.add(new Student(2, "An", "Le", "anle@gmail.com"));
        students.add(new Student(3, "Trinh", "Nguyen", "trinhnguyen@gmail.com"));
        students.add(new Student(4, "Hai", "Van", "haivan@gmail.com"));
    }

    @GetMapping("/students")
    public List<Student> getStudents() {
        return this.students;
    }
}
