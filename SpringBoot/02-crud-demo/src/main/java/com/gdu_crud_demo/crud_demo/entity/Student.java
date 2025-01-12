package com.gdu_crud_demo.crud_demo.entity;

import jakarta.persistence.*;


@Entity
@Table(name= "student")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name= "id")
    private int id;

    @Column(name= "first_name")
    private String first_Name;


    public String getLast_Name() {
        return last_Name;
    }

    public void setLast_Name(String last_Name) {
        this.last_Name = last_Name;
    }

    public String getEmail() {
        return email;
    }

    public Student() {
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirst_Name() {
        return first_Name;
    }

    public void setFirst_Name(String first_Name) {
        this.first_Name = first_Name;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", first_Name='" + first_Name + '\'' +
                ", last_Name='" + last_Name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name= "last_name")
    private String last_Name ;

    @Column(name= "email")
    private String email ;

    public Student(String first_Name, String last_Name, String email) {
        this.first_Name = first_Name;
        this.last_Name = last_Name;
        this.email = email;
    }

}