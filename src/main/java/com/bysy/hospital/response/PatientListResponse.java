package com.bysy.hospital.response;

import com.bysy.hospital.model.PatientEntity;

import java.util.List;

/**
 * Created by mint on 11/6/17.
 */
public class PatientListResponse {

    private List<PatientEntity> patientEntityList;

    private int totalCount;

    public List<PatientEntity> getPatientEntityList() {
        return patientEntityList;
    }

    public void setPatientEntityList(List<PatientEntity> patientEntityList) {
        this.patientEntityList = patientEntityList;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}
