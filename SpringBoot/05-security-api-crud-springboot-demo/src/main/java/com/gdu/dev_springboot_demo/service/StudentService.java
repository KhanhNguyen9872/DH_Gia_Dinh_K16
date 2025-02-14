package com.gdu.dev_springboot_demo.service;

import com.gdu.dev_springboot_demo.entity.Student;
import java.util.List;
public interface StudentService {
    List<Student> findAll();
    Student findById(int id);
    Student save(Student student);
    void deleteById(int id);
}
