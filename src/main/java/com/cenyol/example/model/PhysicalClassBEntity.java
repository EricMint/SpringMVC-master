package com.cenyol.example.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "physical_class_b")
public class PhysicalClassBEntity implements Serializable {
    private int physicalClassBId;
    private String physicalClassBName;
    private int physicalClassAId;
    private String physicalClassAName;


    @Id
    @GeneratedValue
    @Column(name = "physical_class_b_id", nullable = false, insertable = true, updatable = true)
    public int getPhysicalClassBId() {
        return physicalClassBId;
    }

    public void setPhysicalClassBId(int physicalClassBId) {
        this.physicalClassBId = physicalClassBId;
    }

    @Basic
    @Column(name = "physical_class_b_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalClassBName() {
        return physicalClassBName;
    }

    public void setPhysicalClassBName(String physicalClassBName) {
        this.physicalClassBName = physicalClassBName;
    }

    @Basic
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
