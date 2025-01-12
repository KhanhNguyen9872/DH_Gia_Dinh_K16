package com.gdu_crud_demo.crud_demo.dao;

import com.gdu_crud_demo.crud_demo.entity.Student;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class StudentADOimp implements StudentDAO {
    private EntityManager em;

    public StudentADOimp(EntityManager em) {
        this.em = em;
    }

    @Override
    @Transactional
    public void save(Student student) {
        em.persist(student);
    }

    @Override
    public void update(Student student) {

    }

    @Override
    @Transactional
    public void delete(int id) {

        Student student = em.find(Student.class, id);
        em.remove(student);

    }

    @Override
    public Student findById(int id) {
        return em.find(Student.class, id) ;
    }

    @Override
    public List<Student> findAll() {
        TypedQuery<Student> query = em.createQuery("from Student", Student.class);
        return query.getResultList()  ;
    }

    @Override
    public List<Student> findByName(String name) {
        TypedQuery<Student> query = em.createQuery("from Student where first_Name = :theName", Student.class);
        query.setParameter("theName", name);
        return query.getResultList();
    }

    @Override
    @Transactional
    public int deleteAll() {
        int numRows = em.createQuery("delete from Student").executeUpdate();
        return numRows;
    }
}
