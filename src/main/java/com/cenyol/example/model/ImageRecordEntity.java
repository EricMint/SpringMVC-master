package com.cenyol.example.model;

import javax.persistence.*;


@Entity
@Table(name = "image_record")
public class ImageRecordEntity {
    private int imageRecordId;
    private int patientId;

    private int imageClassAId;
    private String imageClassAName;

    private int imageClassBId;
    private String imageClassBName;

    private int imageClassCId;
    private String imageClassCName;

    private int imageClassDId;
    private String imageClassDName;

    private int imageClassEId;
    private String imageClassEName;

    private String result;

    @Id
    @GeneratedValue
    @Column(name = "image_record_id", nullable = false, insertable = true, updatable = true)
    public int getImageRecordId() {
        return imageRecordId;
    }

    public void setImageRecordId(int imageRecordId) {
        this.imageRecordId = imageRecordId;
    }

    @Basic
    @Column(name = "patient_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    @Basic
    @Column(name = "image_class_a_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImageClassAId() {
        return imageClassAId;
    }

    public void setImageClassAId(int imageClassAId) {
        this.imageClassAId = imageClassAId;
    }

    @Basic
    @Column(name = "image_class_a_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassAName() {
        return imageClassAName;
    }

    public void setImageClassAName(String imageClassAName) {
        this.imageClassAName = imageClassAName;
    }

    @Basic
    @Column(name = "image_class_b_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImageClassBId() {
        return imageClassBId;
    }

    public void setImageClassBId(int imageClassBId) {
        this.imageClassBId = imageClassBId;
    }

    @Basic
    @Column(name = "image_class_b_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassBName() {
        return imageClassBName;
    }

    public void setImageClassBName(String imageClassBName) {
        this.imageClassBName = imageClassBName;
    }

    @Basic
    @Column(name = "image_class_c_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImageClassCId() {
        return imageClassCId;
    }

    public void setImageClassCId(int imageClassCId) {
        this.imageClassCId = imageClassCId;
    }

    @Basic
    @Column(name = "image_class_c_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassCName() {
        return imageClassCName;
    }

    public void setImageClassCName(String imageClassCName) {
        this.imageClassCName = imageClassCName;
    }

    @Basic
    @Column(name = "image_class_d_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImageClassDId() {
        return imageClassDId;
    }

    public void setImageClassDId(int imageClassDId) {
        this.imageClassDId = imageClassDId;
    }

    @Basic
    @Column(name = "image_class_d_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassDName() {
        return imageClassDName;
    }

    public void setImageClassDName(String imageClassDName) {
        this.imageClassDName = imageClassDName;
    }

    @Basic
    @Column(name = "image_class_e_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImageClassEId() {
        return imageClassEId;
    }

    public void setImageClassEId(int imageClassEId) {
        this.imageClassEId = imageClassEId;
    }

    @Basic
    @Column(name = "image_class_e_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassEName() {
        return imageClassEName;
    }

    public void setImageClassEName(String imageClassEName) {
        this.imageClassEName = imageClassEName;
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
