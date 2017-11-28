package com.bysy.hospital.request;

import com.sun.istack.internal.NotNull;

/**
 * Created by mint on 11/28/17.
 */
public class PhysicalJizhuCetujixingRequest {
    private Integer patientId;
    private String examType;
    private String examCategory;
    private String examName;
    private String answer;

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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
