package com.cenyol.example.model;

import javax.persistence.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "imaging_examination_item")
public class ImagingExaminationItemEntity {
    private int id;
    private int imagingExaminationCategoryId;
    private String imagingExaminationCategoryName;
    private String imagingExaminationItemName;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "imaging_examination_category_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImagingExaminationCategoryId() {
        return imagingExaminationCategoryId;
    }

    public void setImagingExaminationCategoryId(int imagingExaminationCategoryId) {
        this.imagingExaminationCategoryId = imagingExaminationCategoryId;
    }

    @Basic
    @Column(name = "imaging_examination_category_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImagingExaminationCategoryName() {
        return imagingExaminationCategoryName;
    }

    public void setImagingExaminationCategoryName(String imagingExaminationCategoryName) {
        this.imagingExaminationCategoryName = imagingExaminationCategoryName;
    }

    @Basic
    @Column(name = "imaging_examination_item_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImagingExaminationItemName() {
        return imagingExaminationItemName;
    }

    public void setImagingExaminationItemName(String imagingExaminationItemName) {
        this.imagingExaminationItemName = imagingExaminationItemName;
    }
}
