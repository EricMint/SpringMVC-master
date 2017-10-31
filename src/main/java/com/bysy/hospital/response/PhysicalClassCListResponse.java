package com.bysy.hospital.response;

import com.bysy.hospital.model.PhysicalClassCEntity;

import java.io.Serializable;
import java.util.List;

public class PhysicalClassCListResponse implements Serializable {

    private List<PhysicalClassCEntity> classCEntityList;

    public List<PhysicalClassCEntity> getClassCEntityList() {
        return classCEntityList;
    }

    public void setClassCEntityList(List<PhysicalClassCEntity> classCEntityList) {
        this.classCEntityList = classCEntityList;
    }
}
