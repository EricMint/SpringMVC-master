package com.bysy.hospital.model;

import javax.persistence.*;

@Entity
@Table(name = "image_class_a")
public class ImageClassAEntity {
    private int imageClassAId;
    private String imageClassAName;

    @Id
    @GeneratedValue
    @Column(name = "image_class_a_id", nullable = false, insertable = true, updatable = true)
    public int getImageClassAId() {
        return imageClassAId;
    }

    public void setImageClassAId(int imageClassAId) {
        this.imageClassAId = imageClassAId;
    }

    @Basic
    @Column(name = "image_class_a_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassAName() {
        return imageClassAName;
    }

    public void setImageClassAName(String imageClassAName) {
        this.imageClassAName = imageClassAName;
    }
}
