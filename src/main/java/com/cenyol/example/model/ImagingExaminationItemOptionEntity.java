package com.cenyol.example.model;

import javax.persistence.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "imaging_examination_item_option")
public class ImagingExaminationItemOptionEntity {
    private int id;
    private int imagingExaminationItemId;
    private String imagingExaminationItemName;
    private String imagingExaminationItemOptionName;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "imaging_examination_item_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getImagingExaminationItemId() {
        return imagingExaminationItemId;
    }

    public void setImagingExaminationItemId(int imagingExaminationItemId) {
        this.imagingExaminationItemId = imagingExaminationItemId;
    }

    @Basic
    @Column(name = "imaging_examination_item_option_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImagingExaminationItemOptionName() {
        return imagingExaminationItemOptionName;
    }

    public void setImagingExaminationItemOptionName(String imagingExaminationItemOptionName) {
        this.imagingExaminationItemOptionName = imagingExaminationItemOptionName;
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
