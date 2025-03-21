package com.springboot.dev_spring_boot_demo.service;

import com.springboot.dev_spring_boot_demo.dao.StudentDAO;
import com.springboot.dev_spring_boot_demo.entity.Student;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StudentServiceImp implements StudentService {
    private StudentDAO studentDAO;
    @Autowired
    public StudentServiceImp(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    @Override
    public List<Student> findAll() {
        return studentDAO.findAll();
    }

    @Override
    public Student findById(int id) {
        return studentDAO.findById(id);
    }

    @Override
    public Student save(Student student) {
        return studentDAO.save(student);
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        studentDAO.deleteById(id);
    }
}
