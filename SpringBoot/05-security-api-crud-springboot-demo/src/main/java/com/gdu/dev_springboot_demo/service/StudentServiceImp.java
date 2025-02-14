package com.gdu.dev_springboot_demo.service;

import com.gdu.dev_springboot_demo.dao.StudentDAO;
import com.gdu.dev_springboot_demo.entity.Student;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImp implements StudentService {
    private StudentDAO studentDAO;

    public StudentServiceImp(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }
    @Override
    public List<Student> findAll() {
        return studentDAO.getAllStudents();
    }

    @Override
    public Student findById(int id) {
        return studentDAO.getStudentById(id);
    }

    @Override
    public Student save(Student student) {
        return studentDAO.addStudent(student);
    }

    @Override
    public void deleteById(int id) {
        studentDAO.deleteStudent(id);
    }
}
