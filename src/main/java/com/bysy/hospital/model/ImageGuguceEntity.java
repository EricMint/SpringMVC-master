package com.bysy.hospital.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "image_guguce")
public class ImageGuguceEntity {
    private Integer id;
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private String hengjing;
    private String shizhuangjing;
    private String suiqiang;
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
    @Column(name = "patient_id", nullable = false, insertable = true, updatable = true, length = 200)
    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "exam_type", nullable = false, insertable = true, updatable = true, length = 200)
    public String getExamType() {
        return examType;
    }

    public void setExamType(String examType) {
        this.examType = examType;
    }

    @Basic
    @Column(name = "exam_category", nullable = false, insertable = true, updatable = true, length = 200)
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
    @Column(name = "hengjing", nullable = true, insertable = true, updatable = true, length = 200)
    public String getHengjing() {
        return hengjing;
    }

    public void setHengjing(String hengjing) {
        this.hengjing = hengjing;
    }

    @Basic
    @Column(name = "shizhuangjing", nullable = true, insertable = true, updatable = true, length = 200)
    public String getShizhuangjing() {
        return shizhuangjing;
    }

    public void setShizhuangjing(String shizhuangjing) {
        this.shizhuangjing = shizhuangjing;
    }

    @Basic
    @Column(name = "suiqiang", nullable = true, insertable = true, updatable = true, length = 200)
    public String getSuiqiang() {
        return suiqiang;
    }

    public void setSuiqiang(String suiqiang) {
        this.suiqiang = suiqiang;
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
