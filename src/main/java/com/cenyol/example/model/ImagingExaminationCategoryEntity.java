package com.cenyol.example.model;

import javax.persistence.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "imaging_examination_category")
public class ImagingExaminationCategoryEntity {
    private int id;
    private String imagingExaminationCategoryName;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "imaging_examination_category_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImagingExaminationCategoryName() {
        return imagingExaminationCategoryName;
    }

    public void setImagingExaminationCategoryName(String imagingExaminationCategoryName) {
        this.imagingExaminationCategoryName = imagingExaminationCategoryName;
    }


}
