package com.bysy.hospital.model;

import javax.persistence.*;

@Entity
@Table(name = "physical_class_a")
public class PhysicalClassAEntity {
    private int physicalClassAId;
    private String physicalClassAName;

    @Id
    @GeneratedValue
    @Column(name = "physical_class_a_id", nullable = false, insertable = true, updatable = true)
    public int getPhysicalClassAId() {
        return physicalClassAId;
    }

    public void setPhysicalClassAId(int physicalClassAId) {
        this.physicalClassAId = physicalClassAId;
    }

    @Basic
    @Column(name = "physical_class_a_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalClassAName() {
        return physicalClassAName;
    }

    public void setPhysicalClassAName(String physicalClassAName) {
        this.physicalClassAName = physicalClassAName;
    }
}
