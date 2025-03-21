package com.gdu_springboot.springboot_demo.dao;

import com.gdu_springboot.springboot_demo.entiy.Student;

import java.util.List;

public interface StudentDAO {
    Student getStudentById(int id);
    List<Student> getAllStudents();
    Student save(Student student);
    void delete(int id);
}
