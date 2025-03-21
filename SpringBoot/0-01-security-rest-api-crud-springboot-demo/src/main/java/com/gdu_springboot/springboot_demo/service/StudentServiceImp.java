package com.gdu_springboot.springboot_demo.service;

import com.gdu_springboot.springboot_demo.dao.StudentDAO;
import com.gdu_springboot.springboot_demo.entiy.Student;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StudentServiceImp implements StudentService {
    private StudentDAO studentDAO;

    public StudentServiceImp(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    @Override
    public Student getStudentById(int id) {
        return studentDAO.getStudentById(id);
    }

    @Override
    public List<Student> getAllStudents() {
        return studentDAO.getAllStudents();
    }

    @Override
    public Student addStudent(Student student) {
        return studentDAO.save(student);
    }

    @Override
    public void deleteStudent(int id) {
        studentDAO.delete(id);
    }
}
