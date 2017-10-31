package com.bysy.hospital.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "image_class_b")
public class ImageClassBEntity implements Serializable {
    private int imageClassBId;
    private String imageClassBName;
    private int imageClassAId;
    private String imageClassAName;


    @Id
    @GeneratedValue
    @Column(name = "image_class_b_id", nullable = false, insertable = true, updatable = true)
    public int getImageClassBId() {
        return imageClassBId;
    }

    public void setImageClassBId(int imageClassBId) {
        this.imageClassBId = imageClassBId;
    }

    @Basic
    @Column(name = "image_class_b_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassBName() {
        return imageClassBName;
    }

    public void setImageClassBName(String imageClassBName) {
        this.imageClassBName = imageClassBName;
    }

    @Basic
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
