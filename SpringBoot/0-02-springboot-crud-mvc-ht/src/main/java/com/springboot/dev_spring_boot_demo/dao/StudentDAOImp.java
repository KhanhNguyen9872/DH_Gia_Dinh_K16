package com.springboot.dev_spring_boot_demo.dao;

import com.springboot.dev_spring_boot_demo.entity.Student;
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
    public List<Student> findAll() {
        TypedQuery<Student> query = em.createQuery("from Student", Student.class);
        return query.getResultList();
    }

    @Override
    public Student findById(int id) {
        return em.find(Student.class, id);
    }

    @Override
    @Transactional
    public Student save(Student student) {
        Student saved = em.merge(student);

        return saved;
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        Student student = em.find(Student.class, id);
        em.remove(student);
    }
}
