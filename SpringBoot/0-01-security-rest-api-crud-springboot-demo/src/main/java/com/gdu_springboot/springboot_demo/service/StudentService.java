package com.gdu_springboot.springboot_demo.service;

import com.gdu_springboot.springboot_demo.entiy.Student;

import java.util.List;

public interface StudentService {
    Student getStudentById(int id);
    List<Student> getAllStudents();
    Student addStudent(Student student);
    void deleteStudent(int id);
}
