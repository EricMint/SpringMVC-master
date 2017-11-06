package com.bysy.hospital.response;

import com.bysy.hospital.model.ImageClassBEntity;
import com.bysy.hospital.model.ImageClassCEntity;

import java.io.Serializable;
import java.util.List;

public class ImageClassB implements Serializable {

    private int imageClassBId;
    private String imageClassBName;
    private int imageClassAId;
    private String imageClassAName;
    private List<ImageClassCEntity> imageClassCEntityList;

    public int getImageClassBId() {
        return imageClassBId;
    }

    public void setImageClassBId(int imageClassBId) {
        this.imageClassBId = imageClassBId;
    }

    public String getImageClassBName() {
        return imageClassBName;
    }

    public void setImageClassBName(String imageClassBName) {
        this.imageClassBName = imageClassBName;
    }

    public int getImageClassAId() {
        return imageClassAId;
    }

    public void setImageClassAId(int imageClassAId) {
        this.imageClassAId = imageClassAId;
    }

    public String getImageClassAName() {
        return imageClassAName;
    }

    public void setImageClassAName(String imageClassAName) {
        this.imageClassAName = imageClassAName;
    }

    public List<ImageClassCEntity> getImageClassCEntityList() {
        return imageClassCEntityList;
    }

    public void setImageClassCEntityList(List<ImageClassCEntity> imageClassCEntityList) {
        this.imageClassCEntityList = imageClassCEntityList;
    }
}
