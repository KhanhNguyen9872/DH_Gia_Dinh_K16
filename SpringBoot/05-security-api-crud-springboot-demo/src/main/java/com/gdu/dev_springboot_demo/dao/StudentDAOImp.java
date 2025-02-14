package com.gdu.dev_springboot_demo.dao;

import com.gdu.dev_springboot_demo.entity.Student;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class StudentDAOImp implements StudentDAO {
    private EntityManager em;
    @Autowired
    public StudentDAOImp(EntityManager em) {
        this.em = em;
    }

    @Override
    public Student getStudentById(int id) {
        return em.find(Student.class, id);
    }

    @Override
    public List<Student> getAllStudents() {
        TypedQuery<Student> query = em.createQuery("select s from Student s", Student.class);
        List<Student> students = query.getResultList();

        return students;
    }

    @Override
    @Transactional
    public Student addStudent(Student student) {
        Student newStudent = em.merge(student);
        return newStudent;
    }

    @Override
    @Transactional
    public void deleteStudent(int id) {
        em.remove(em.find(Student.class, id));
    }
}
