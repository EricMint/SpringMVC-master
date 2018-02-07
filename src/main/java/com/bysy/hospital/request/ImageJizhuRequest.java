package com.bysy.hospital.request;

public class ImageJizhuRequest {
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examPosition;
    private String examName;
    private String examResult;

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

    public String getExamPosition() {
        return examPosition;
    }

    public void setExamPosition(String examPosition) {
        this.examPosition = examPosition;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getExamResult() {
        return examResult;
    }

    public void setExamResult(String examResult) {
        this.examResult = examResult;
    }
}
