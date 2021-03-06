package com.bysy.hospital.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "physical_kuanguanjie_jixing")
public class PhysicalKuanguanjieJixingEntity {
    private Integer id;
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private Integer hasSymptom;
    private String neishou;
    private String waizhan;
    private String xuanzhuan;
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
    @Column(name = "has_symptom", nullable = true, insertable = true, updatable = true, length = 200)
    public Integer getHasSymptom() {
        return hasSymptom;
    }

    public void setHasSymptom(Integer hasSymptom) {
        this.hasSymptom = hasSymptom;
    }

    @Basic
    @Column(name = "neishou", nullable = true, insertable = true, updatable = true, length = 200)
    public String getNeishou() {
        return neishou;
    }

    public void setNeishou(String neishou) {
        this.neishou = neishou;
    }

    @Basic
    @Column(name = "waizhan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getWaizhan() {
        return waizhan;
    }

    public void setWaizhan(String waizhan) {
        this.waizhan = waizhan;
    }

    @Basic
    @Column(name = "xuanzhuan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getXuanzhuan() {
        return xuanzhuan;
    }

    public void setXuanzhuan(String xuanzhuan) {
        this.xuanzhuan = xuanzhuan;
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
