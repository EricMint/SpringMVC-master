package com.cenyol.example.model;

import javax.persistence.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "physical_examination_item_option")
public class PhysicalExaminationItemOptionEntity {
    private int id;
    private int physicalExaminationItemId;
    private String physicalExaminationItemName;
    private String physicalExaminationItemOptionName;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "physical_examination_item_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getPhysicalExaminationItemId() {
        return physicalExaminationItemId;
    }

    public void setPhysicalExaminationItemId(int physicalExaminationItemId) {
        this.physicalExaminationItemId = physicalExaminationItemId;
    }

    @Basic
    @Column(name = "physical_examination_item_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalExaminationItemName() {
        return physicalExaminationItemName;
    }

    public void setPhysicalExaminationItemName(String physicalExaminationItemName) {
        this.physicalExaminationItemName = physicalExaminationItemName;
    }


    @Basic
    @Column(name = "physical_examination_item_option_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalExaminationItemOptionName() {
        return physicalExaminationItemOptionName;
    }

    public void setPhysicalExaminationItemOptionName(String physicalExaminationItemOptionName) {
        this.physicalExaminationItemOptionName = physicalExaminationItemOptionName;
    }
}
