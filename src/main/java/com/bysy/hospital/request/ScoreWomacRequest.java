package com.bysy.hospital.request;

/**
 * Created by mint on 11/28/17.
 */
public class PhysicalJizhuCetujixingRequest {
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private Integer hasSymptom;
    private String qiantu;
    private String houtu;
    private String cetu;

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public String getExamType() {
        return examType;
    }

    public void setExamType(String examType) {
        this.examType = examType;
    }

    public String getExamCategory() {
        return examCategory;
    }

    public void setExamCategory(String examCategory) {
        this.examCategory = examCategory;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Integer getHasSymptom() {
        return hasSymptom;
    }

    public void setHasSymptom(Integer hasSymptom) {
        this.hasSymptom = hasSymptom;
    }

    public String getQiantu() {
        return qiantu;
    }

    public void setQiantu(String qiantu) {
        this.qiantu = qiantu;
    }

    public String getHoutu() {
        return houtu;
    }

    public void setHoutu(String houtu) {
        this.houtu = houtu;
    }

    public String getCetu() {
        return cetu;
    }

    public void setCetu(String cetu) {
        this.cetu = cetu;
    }
}
