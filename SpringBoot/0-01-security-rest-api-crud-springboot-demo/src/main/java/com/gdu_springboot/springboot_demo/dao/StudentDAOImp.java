package com.gdu_springboot.springboot_demo.dao;

import com.gdu_springboot.springboot_demo.entiy.Student;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentDAOImp implements StudentDAO {

    private EntityManager em;
    public StudentDAOImp(EntityManager em) {
        this.em = em;
    }

    @Override
    public Student getStudentById(int id) {
        return em.find(Student.class, id);
    }

    @Override
    public List<Student> getAllStudents() {
        TypedQuery<Student> query = em.createQuery("from Student", Student.class);
        return query.getResultList();
    }

    @Override
    @Transactional
    public Student save(Student student) {
        return em.merge(student);
    }

    @Override
    @Transactional
    public void delete(int id) {
        em.remove(em.find(Student.class, id));
    }
}
