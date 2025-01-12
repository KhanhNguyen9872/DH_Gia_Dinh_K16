package com.gdu_crud_demo.crud_demo.dao;

import com.gdu_crud_demo.crud_demo.entity.Student;

import java.util.List;

public interface StudentDAO {
    void save(Student student);
    void update(Student student);
    void delete(int id);
    Student findById(int id);
    List<Student> findAll();
    List<Student> findByName(String name);
    int deleteAll();


}
