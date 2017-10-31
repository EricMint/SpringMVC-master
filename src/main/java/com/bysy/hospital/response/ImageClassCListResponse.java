package com.bysy.hospital.response;

import com.bysy.hospital.model.ImageClassCEntity;

import java.io.Serializable;
import java.util.List;

public class ImageClassCListResponse implements Serializable {

    private List<ImageClassCEntity> classCEntityList;

    public List<ImageClassCEntity> getClassCEntityList() {
        return classCEntityList;
    }

    public void setClassCEntityList(List<ImageClassCEntity> classCEntityList) {
        this.classCEntityList = classCEntityList;
    }
}
