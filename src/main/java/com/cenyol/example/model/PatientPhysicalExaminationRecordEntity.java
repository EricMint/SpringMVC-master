package com.cenyol.example.model;

import javax.persistence.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "patient_physical_examination_record")
public class PatientPhysicalExaminationRecordEntity {
    private int id;
    private int userId;
    private int patientNumber;
    private int physicalExaminationCategoryId;
    private String physicalExaminationCategoryName;
    private int physicalExaminationItemId;
    private String physicalExaminationItemName;
    private int physicalExaminationItemOptionId;
    private String physicalExaminationItemOptionName;
    private int physicalExaminationItemOptionSubId;
    private String physicalExaminationItemOptionSubName;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @Basic
    @Column(name = "user_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
    @Column(name = "physical_examination_category_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getPhysicalExaminationCategoryId() {
        return physicalExaminationCategoryId;
    }

    public void setPhysicalExaminationCategoryId(int physicalExaminationCategoryId) {
        this.physicalExaminationCategoryId = physicalExaminationCategoryId;
    }

    @Basic
    @Column(name = "physical_examination_category_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalExaminationCategoryName() {
        return physicalExaminationCategoryName;
    }

    public void setPhysicalExaminationCategoryName(String physicalExaminationCategoryName) {
        this.physicalExaminationCategoryName = physicalExaminationCategoryName;
    }

    @Basic
    @Column(name = "physical_examination_item_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getPhysicalExaminationItemId() {
        return physicalExaminationItemId;
    }

    public void setPhysicalExaminationItemId(int physicalExaminationItemId) {
        this.physicalExaminationItemId = physicalExaminationItemId;
    }

    @Basic
    @Column(name = "physical_examination_item_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalExaminationItemName() {
        return physicalExaminationItemName;
    }

    public void setPhysicalExaminationItemName(String physicalExaminationItemName) {
        this.physicalExaminationItemName = physicalExaminationItemName;
    }

    @Basic
    @Column(name = "physical_examination_item_option_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getPhysicalExaminationItemOptionId() {
        return physicalExaminationItemOptionId;
    }

    public void setPhysicalExaminationItemOptionId(int physicalExaminationItemOptionId) {
        this.physicalExaminationItemOptionId = physicalExaminationItemOptionId;
    }

    @Basic
    @Column(name = "physical_examination_item_option_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalExaminationItemOptionName() {
        return physicalExaminationItemOptionName;
    }

    public void setPhysicalExaminationItemOptionName(String physicalExaminationItemOptionName) {
        this.physicalExaminationItemOptionName = physicalExaminationItemOptionName;
    }

    @Basic
    @Column(name = "physical_examination_item_option_sub_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getPhysicalExaminationItemOptionSubId() {
        return physicalExaminationItemOptionSubId;
    }

    public void setPhysicalExaminationItemOptionSubId(int physicalExaminationItemOptionSubId) {
        this.physicalExaminationItemOptionSubId = physicalExaminationItemOptionSubId;
    }

    @Basic
    @Column(name = "physical_examination_item_option_sub_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalExaminationItemOptionSubName() {
        return physicalExaminationItemOptionSubName;
    }

    public void setPhysicalExaminationItemOptionSubName(String physicalExaminationItemOptionSubName) {
        this.physicalExaminationItemOptionSubName = physicalExaminationItemOptionSubName;
    }
}
