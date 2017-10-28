package com.cenyol.example.model;

import javax.persistence.*;


@Entity
@Table(name = "image_record")
public class ImageRecordEntity {
    private Integer imageRecordId;
    private Integer patientId;

    private Integer imageClassAId;
    private String imageClassAName;

    private Integer imageClassBId;
    private String imageClassBName;

    private Integer imageClassCId;
    private String imageClassCName;

    private Integer imageClassDId;
    private String imageClassDName;

    private Integer imageClassEId;
    private String imageClassEName;

    private String result;

    @Id
    @GeneratedValue
    @Column(name = "image_record_id", nullable = false, insertable = true, updatable = true)
    public Integer getImageRecordId() {
        return imageRecordId;
    }

    public void setImageRecordId(Integer imageRecordId) {
        this.imageRecordId = imageRecordId;
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
    @Column(name = "image_class_a_id", nullable = true, insertable = true, updatable = true, length = 200)
    public Integer getImageClassAId() {
        return imageClassAId;
    }

    public void setImageClassAId(Integer imageClassAId) {
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
    public Integer getImageClassBId() {
        return imageClassBId;
    }

    public void setImageClassBId(Integer imageClassBId) {
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
    public Integer getImageClassCId() {
        return imageClassCId;
    }

    public void setImageClassCId(Integer imageClassCId) {
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
    public Integer getImageClassDId() {
        return imageClassDId;
    }

    public void setImageClassDId(Integer imageClassDId) {
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
    public Integer getImageClassEId() {
        return imageClassEId;
    }

    public void setImageClassEId(Integer imageClassEId) {
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
