package com.gdu_springboot.dev_springboot.dao;

import com.gdu_springboot.dev_springboot.entity.Student;

import java.util.List;

public interface StudentDAO {
    Student getStudentById(int id);
    List<Student> getAllStudents();
}
