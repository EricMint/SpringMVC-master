package com.cenyol.example.model;

import javax.persistence.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "patient_imaging_examination_record")
public class PatientImagingExaminationRecordEntity {
    private int id;
    private int userId;
    private int patientNumber;
    private int imagingExaminationCategoryId;
    private String imagingExaminationCategoryName;
    private int imagingExaminationItemId;
    private String imagingExaminationItemName;
    private int imagingExaminationItemOptionId;
    private String imagingExaminationItemOptionName;


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
    @Column(name = "imaging_examination_category_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImagingExaminationCategoryId() {
        return imagingExaminationCategoryId;
    }

    public void setImagingExaminationCategoryId(int imagingExaminationCategoryId) {
        this.imagingExaminationCategoryId = imagingExaminationCategoryId;
    }

    @Basic
    @Column(name = "imaging_examination_category_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImagingExaminationCategoryName() {
        return imagingExaminationCategoryName;
    }

    public void setImagingExaminationCategoryName(String imagingExaminationCategoryName) {
        this.imagingExaminationCategoryName = imagingExaminationCategoryName;
    }

    @Basic
    @Column(name = "imaging_examination_item_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImagingExaminationItemId() {
        return imagingExaminationItemId;
    }

    public void setImagingExaminationItemId(int imagingExaminationItemId) {
        this.imagingExaminationItemId = imagingExaminationItemId;
    }

    @Basic
    @Column(name = "imaging_examination_item_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImagingExaminationItemName() {
        return imagingExaminationItemName;
    }

    public void setImagingExaminationItemName(String imagingExaminationItemName) {
        this.imagingExaminationItemName = imagingExaminationItemName;
    }

    @Basic
    @Column(name = "imaging_examination_item_option_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImagingExaminationItemOptionId() {
        return imagingExaminationItemOptionId;
    }

    public void setImagingExaminationItemOptionId(int imagingExaminationItemOptionId) {
        this.imagingExaminationItemOptionId = imagingExaminationItemOptionId;
    }

    @Basic
    @Column(name = "imaging_examination_item_option_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImagingExaminationItemOptionName() {
        return imagingExaminationItemOptionName;
    }

    public void setImagingExaminationItemOptionName(String imagingExaminationItemOptionName) {
        this.imagingExaminationItemOptionName = imagingExaminationItemOptionName;
    }


}
