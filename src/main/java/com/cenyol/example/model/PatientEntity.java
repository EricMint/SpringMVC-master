package com.cenyol.example.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "patient")
public class PatientEntity {
    private int id;
    private int patientNumber;
    private String realName;
    private String disease;
    private String ethnicity;
    private String gender;
    private int age;
    private int height;
    private int weight;

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, insertable = true, updatable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "patient_number", nullable = true, insertable = true, updatable = true, length = 200)
    public int getPatientNumber() {
        return patientNumber;
    }

    public void setPatientNumber(int patientNumber) {
        this.patientNumber = patientNumber;
    }

    @Basic
    @Column(name = "disease", nullable = true, insertable = true, updatable = true, length = 200)
    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    @Basic
    @Column(name = "real_name", nullable = true, insertable = true, updatable = true, length = 45)
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    @Basic
    @Column(name = "ethnicity", nullable = true, insertable = true, updatable = true, length = 45)
    public String getEthnicity() {
        return ethnicity;
    }

    public void setEthnicity(String ethnicity) {
        this.ethnicity = ethnicity;
    }

    @Basic
    @Column(name = "gender", nullable = true, insertable = true, updatable = true, length = 45)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "age", nullable = true, insertable = true, updatable = true, length = 45)
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Basic
    @Column(name = "height", nullable = true, insertable = true, updatable = true, length = 45)
    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    @Basic
    @Column(name = "weight", nullable = true, insertable = true, updatable = true, length = 45)
    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }


    //    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//
//        PatientEntity that = (PatientEntity) o;
//
//        if (id != that.id) return false;
//        if (firstName != null ? !firstName.equals(that.firstName) : that.firstName != null) return false;
//        if (lastName != null ? !lastName.equals(that.lastName) : that.lastName != null) return false;
//        if (password != null ? !password.equals(that.password) : that.password != null) return false;
//
//        return true;
//    }
//
//    @Override
//    public int hashCode() {
//        int result = id;
//        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
//        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
//        result = 31 * result + (password != null ? password.hashCode() : 0);
//        return result;
//    }
//
//    @OneToMany(mappedBy = "userByUserid")
//    public Collection<BlogEntity> getBlogsById() {
//        return blogsById;
//    }
//
//    public void setBlogsById(Collection<BlogEntity> blogsById) {
//        this.blogsById = blogsById;
//    }
}
