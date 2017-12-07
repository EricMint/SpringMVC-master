package com.bysy.hospital.request;

public class ImageGuguceRequest {
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private String hengjing;
    private String shizhuangjing;
    private String suiqiang;

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

    public String getHengjing() {
        return hengjing;
    }

    public void setHengjing(String hengjing) {
        this.hengjing = hengjing;
    }

    public String getShizhuangjing() {
        return shizhuangjing;
    }

    public void setShizhuangjing(String shizhuangjing) {
        this.shizhuangjing = shizhuangjing;
    }

    public String getSuiqiang() {
        return suiqiang;
    }

    public void setSuiqiang(String suiqiang) {
        this.suiqiang = suiqiang;
    }
}
