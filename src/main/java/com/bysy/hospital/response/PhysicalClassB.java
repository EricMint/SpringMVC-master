package com.bysy.hospital.response;

import com.bysy.hospital.model.PhysicalClassBEntity;
import com.bysy.hospital.model.PhysicalClassCEntity;

import java.io.Serializable;
import java.util.List;

public class PhysicalClassB implements Serializable {
    private int physicalClassBId;
    private String physicalClassBName;
    private int physicalClassAId;
    private String physicalClassAName;
    private List<PhysicalClassCEntity> physicalClassCEntityList;

    public int getPhysicalClassBId() {
        return physicalClassBId;
    }

    public void setPhysicalClassBId(int physicalClassBId) {
        this.physicalClassBId = physicalClassBId;
    }

    public String getPhysicalClassBName() {
        return physicalClassBName;
    }

    public void setPhysicalClassBName(String physicalClassBName) {
        this.physicalClassBName = physicalClassBName;
    }

    public int getPhysicalClassAId() {
        return physicalClassAId;
    }

    public void setPhysicalClassAId(int physicalClassAId) {
        this.physicalClassAId = physicalClassAId;
    }

    public String getPhysicalClassAName() {
        return physicalClassAName;
    }

    public void setPhysicalClassAName(String physicalClassAName) {
        this.physicalClassAName = physicalClassAName;
    }

    public List<PhysicalClassCEntity> getPhysicalClassCEntityList() {
        return physicalClassCEntityList;
    }

    public void setPhysicalClassCEntityList(List<PhysicalClassCEntity> physicalClassCEntityList) {
        this.physicalClassCEntityList = physicalClassCEntityList;
    }
}
