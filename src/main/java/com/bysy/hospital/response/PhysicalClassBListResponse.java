package com.bysy.hospital.response;

import com.bysy.hospital.model.PhysicalClassBEntity;

import java.io.Serializable;
import java.util.List;

public class PhysicalClassBListResponse implements Serializable {

    private List<PhysicalClassBEntity> classBEntityList;

    public List<PhysicalClassBEntity> getClassBEntityList() {
        return classBEntityList;
    }

    public void setClassBEntityList(List<PhysicalClassBEntity> classBEntityList) {
        this.classBEntityList = classBEntityList;
    }
}
