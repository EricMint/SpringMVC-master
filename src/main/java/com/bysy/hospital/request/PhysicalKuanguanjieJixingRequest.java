package com.bysy.hospital.request;

/**
 * Created by mint on 12/05/17.
 */
public class PhysicalKuanguanjieJixingRequest {
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private Integer hasSymptom;
    private String neishou;
    private String waizhan;
    private String xuanzhuan;

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

    public String getNeishou() {
        return neishou;
    }

    public void setNeishou(String neishou) {
        this.neishou = neishou;
    }

    public String getWaizhan() {
        return waizhan;
    }

    public void setWaizhan(String waizhan) {
        this.waizhan = waizhan;
    }

    public String getXuanzhuan() {
        return xuanzhuan;
    }

    public void setXuanzhuan(String xuanzhuan) {
        this.xuanzhuan = xuanzhuan;
    }
}
