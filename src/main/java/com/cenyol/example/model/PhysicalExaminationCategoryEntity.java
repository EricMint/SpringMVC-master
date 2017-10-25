package com.cenyol.example.model;

import javax.persistence.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "physical_examination_category")
public class PhysicalExaminationCategoryEntity {
    private int id;
    private String physicalExaminationCategoryName;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "physical_examination_category_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPhysicalExaminationCategoryName() {
        return physicalExaminationCategoryName;
    }

    public void setPhysicalExaminationCategoryName(String physicalExaminationCategoryName) {
        this.physicalExaminationCategoryName = physicalExaminationCategoryName;
    }
}
