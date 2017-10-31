package com.bysy.hospital.response;

import com.bysy.hospital.model.ImageClassBEntity;

import java.io.Serializable;
import java.util.List;

public class ImageClassBListResponse implements Serializable {

    private List<ImageClassBEntity> classBEntityList;

    public List<ImageClassBEntity> getClassBEntityList() {
        return classBEntityList;
    }

    public void setClassBEntityList(List<ImageClassBEntity> classBEntityList) {
        this.classBEntityList = classBEntityList;
    }
}
