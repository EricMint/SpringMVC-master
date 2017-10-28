package com.cenyol.example.model;

import javax.persistence.*;


@Entity
@Table(name = "physical_record")
public class PhysicalRecordEntity {
    private Integer physicalRecordId;
    private Integer patientId;

    private Integer physicalClassAId;
    private String physicalClassAName;

    private Integer physicalClassBId;
    private String physicalClassBName;

    private Integer physicalClassCId;
    private String physicalClassCName;

    private Integer physicalClassDId;
    private String physicalClassDName;

    private String result;

    @Id
    @GeneratedValue
    @Column(name = "physical_record_id", nullable = false, insertable = true, updatable = true)
    public Integer getPhysicalRecordId() {
        return physicalRecordId;
    }

    public void setPhysicalRecordId(Integer physicalRecordId) {
        this.physicalRecordId = physicalRecordId;
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
    @Column(name = "physical_class_a_id", nullable = true, insertable = true, updatable = true, length = 200)
    public Integer getPhysicalClassAId() {
        return physicalClassAId;
    }

    public void setPhysicalClassAId(Integer physicalClassAId) {
        this.physicalClassAId = physicalClassAId;
    }

    @Basic
    @Column(name = "physical_class_a_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalClassAName() {
        return physicalClassAName;
    }

    public void setPhysicalClassAName(String physicalClassAName) {
        this.physicalClassAName = physicalClassAName;
    }

    @Basic
    @Column(name = "physical_class_b_id", nullable = true, insertable = true, updatable = true, length = 200)
    public Integer getPhysicalClassBId() {
        return physicalClassBId;
    }

    public void setPhysicalClassBId(Integer physicalClassBId) {
        this.physicalClassBId = physicalClassBId;
    }

    @Basic
    @Column(name = "physical_class_b_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalClassBName() {
        return physicalClassBName;
    }

    public void setPhysicalClassBName(String physicalClassBName) {
        this.physicalClassBName = physicalClassBName;
    }

    @Basic
    @Column(name = "physical_class_c_id", nullable = true, insertable = true, updatable = true, length = 200)
    public Integer getPhysicalClassCId() {
        return physicalClassCId;
    }

    public void setPhysicalClassCId(Integer physicalClassCId) {
        this.physicalClassCId = physicalClassCId;
    }

    @Basic
    @Column(name = "physical_class_c_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalClassCName() {
        return physicalClassCName;
    }

    public void setPhysicalClassCName(String physicalClassCName) {
        this.physicalClassCName = physicalClassCName;
    }

    @Basic
    @Column(name = "physical_class_d_id", nullable = true, insertable = true, updatable = true, length = 200)
    public Integer getPhysicalClassDId() {
        return physicalClassDId;
    }

    public void setPhysicalClassDId(Integer physicalClassDId) {
        this.physicalClassDId = physicalClassDId;
    }

    @Basic
    @Column(name = "physical_class_d_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalClassDName() {
        return physicalClassDName;
    }

    public void setPhysicalClassDName(String physicalClassDName) {
        this.physicalClassDName = physicalClassDName;
    }

    @Basic
    @Column(name = "result", nullable = true, insertable = true, updatable = true, length = 200)
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }


}
