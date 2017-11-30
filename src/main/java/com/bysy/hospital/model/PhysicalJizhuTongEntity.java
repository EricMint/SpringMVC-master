package com.bysy.hospital.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "physical_jizhu_tong")
public class PhysicalJizhuTongEntity {
    private Integer id;
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private String examJingzhui;
    private String examXiongzhui;
    private String examYaozhui;
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
    @Column(name = "exam_jingzhui", nullable = true, insertable = true, updatable = true, length = 200)
    public String getExamJingzhui() {
        return examJingzhui;
    }

    public void setExamJingzhui(String examJingzhui) {
        this.examJingzhui = examJingzhui;
    }

    @Basic
    @Column(name = "exam_xiongzhui", nullable = true, insertable = true, updatable = true, length = 200)
    public String getExamXiongzhui() {
        return examXiongzhui;
    }

    public void setExamXiongzhui(String examXiongzhui) {
        this.examXiongzhui = examXiongzhui;
    }

    @Basic
    @Column(name = "exam_yaozhui", nullable = true, insertable = true, updatable = true, length = 200)
    public String getExamYaozhui() {
        return examYaozhui;
    }

    public void setExamYaozhui(String examYaozhui) {
        this.examYaozhui = examYaozhui;
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
