package com.gdu_springboot.dev_springboot.dao;

import com.gdu_springboot.dev_springboot.entity.Student;

import java.util.List;

public class StudentDAOImp implements StudentDAO {

    @Override
    public Student getStudentById(int id) {
        return null;
    }

    @Override
    public List<Student> getAllStudents() {
        return List.of();
    }
}
