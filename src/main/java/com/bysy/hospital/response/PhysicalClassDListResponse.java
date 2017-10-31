package com.bysy.hospital.response;

import com.bysy.hospital.model.PhysicalClassDEntity;

import java.io.Serializable;
import java.util.List;

public class PhysicalClassDListResponse implements Serializable {

    private List<PhysicalClassDEntity> classDEntityList;

    public List<PhysicalClassDEntity> getClassDEntityList() {
        return classDEntityList;
    }

    public void setClassDEntityList(List<PhysicalClassDEntity> classDEntityList) {
        this.classDEntityList = classDEntityList;
    }
}
