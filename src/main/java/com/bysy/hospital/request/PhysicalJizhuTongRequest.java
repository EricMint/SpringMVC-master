package com.bysy.hospital.request;

/**
 * Created by mint on 11/30/17.
 */
public class PhysicalJizhuTongRequest {
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private String examJingzhui;
    private String examXiongzhui;
    private String examYaozhui;

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

    public String getExamJingzhui() {
        return examJingzhui;
    }

    public void setExamJingzhui(String examJingzhui) {
        this.examJingzhui = examJingzhui;
    }

    public String getExamXiongzhui() {
        return examXiongzhui;
    }

    public void setExamXiongzhui(String examXiongzhui) {
        this.examXiongzhui = examXiongzhui;
    }

    public String getExamYaozhui() {
        return examYaozhui;
    }

    public void setExamYaozhui(String examYaozhui) {
        this.examYaozhui = examYaozhui;
    }
}
