package com.cenyol.example.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "image_class_c")
public class ImageClassCEntity implements Serializable {
    private int imageClassCId;
    private String imageClassCName;
    private int imageClassBId;
    private String imageClassBName;
    private int imageClassAId;
    private String imageClassAName;

    @Id
    @GeneratedValue
    @Column(name = "image_class_c_id", nullable = false, insertable = true, updatable = true)
    public int getImageClassCId() {
        return imageClassCId;
    }

    public void setImageClassCId(int imageClassCId) {
        this.imageClassCId = imageClassCId;
    }

    @Basic
    @Column(name = "image_class_c_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getImageClassCName() {
        return imageClassCName;
    }

    public void setImageClassCName(String imageClassCName) {
        this.imageClassCName = imageClassCName;
    }

    @Basic
    @Column(name = "image_class_b_id", nullable = true, insertable = true, updatable = true, length = 200)
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
