package com.bysy.hospital.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "physical_kuanguanjie_huodongdu")
public class PhysicalKuanguanjieHuodongduEntity {
    private Integer id;
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private String ququ;
    private String houshen;
    private String neixuan;
    private String waixuan;
    private String neishou;
    private String waizhan;
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
    @Column(name = "ququ", nullable = true, insertable = true, updatable = true, length = 200)
    public String getQuqu() {
        return ququ;
    }

    public void setQuqu(String ququ) {
        this.ququ = ququ;
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
    @Column(name = "neixuan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getNeixuan() {
        return neixuan;
    }

    public void setNeixuan(String neixuan) {
        this.neixuan = neixuan;
    }

    @Basic
    @Column(name = "waixuan", nullable = true, insertable = true, updatable = true, length = 200)
    public String getWaixuan() {
        return waixuan;
    }

    public void setWaixuan(String waixuan) {
        this.waixuan = waixuan;
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
