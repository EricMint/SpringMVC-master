package com.bysy.hospital.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "physical_jizhu_huodongdu")
public class PhysicalJizhuHuodongduEntity {
    private Integer id;
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private String examPosition;
    private String qianqu;
    private String houshen;
    private String zuocewan;
    private String youcewan;
    private String zuocexuan;
    private String youcexuan;
    private Date updateTime;
    private String updateBy;

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "patient_id", nullable = true, insertable = true, updatable = true, length = 200)
    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "exam_type", nullable = true, insertable = true, updatable = true, length = 200)
    public String getExamType() {
        return examType;
    }

    public void setExamType(String examType) {
        this.examType = examType;
    }

    @Basic
    @Column(name = "exam_category", nullable = true, insertable = true, updatable = true, length = 200)
    public String getExamCategory() {
        return examCategory;
    }

    public void setExamCategory(String examCategory) {
        this.examCategory = examCategory;
    }

    @Basic
    @Column(name = "exam_name", nullable = false, insertable = true, updatable = true, length = 200)
    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    @Basic
    @Column(name = "exam_position", nullable = false, insertable = true, updatable = true, length = 200)
    public String getExamPosition() {
        return examPosition;
    }

    public void setExamPosition(String examPosition) {
        this.examPosition = examPosition;
    }

    @Basic
    @Column(name = "qianqu", nullable = true, insertable = true, updatable = true, length = 200)
    public String getQianqu() {
        return qianqu;
    }

    public void setQianqu(String qianqu) {
        this.qianqu = qianqu;
    }

    @Basic
    @Column(name = "houshen", nullable = true, insertable = true, updatable = true, length = 200)
    public String getHoushen() {
        return houshen;
    }

    public void setHoushen(String houshen) {
        this.houshen = houshen;
    }

    @Basic
    @Column(name = "zuocewan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getZuocewan() {
        return zuocewan;
    }

    public void setZuocewan(String zuocewan) {
        this.zuocewan = zuocewan;
    }

    @Basic
    @Column(name = "youcewan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getYoucewan() {
        return youcewan;
    }

    public void setYoucewan(String youcewan) {
        this.youcewan = youcewan;
    }

    @Basic
    @Column(name = "zuocexuan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getZuocexuan() {
        return zuocexuan;
    }

    public void setZuocexuan(String zuocexuan) {
        this.zuocexuan = zuocexuan;
    }

    @Basic
    @Column(name = "youcexuan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getYoucexuan() {
        return youcexuan;
    }

    public void setYoucexuan(String youcexuan) {
        this.youcexuan = youcexuan;
    }

    @Basic
    @Column(name = "update_time", nullable = true, insertable = true, updatable = true, length = 200)
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "update_by", nullable = true, insertable = true, updatable = true, length = 200)
    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
