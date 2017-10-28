package com.cenyol.example.response;

import com.cenyol.example.model.PhysicalClassBEntity;

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
