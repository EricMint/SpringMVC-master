package com.bysy.hospital.response;

import com.bysy.hospital.model.ImageClassDEntity;

import java.io.Serializable;
import java.util.List;

public class ImageClassDListResponse implements Serializable {

    private List<ImageClassDEntity> classDEntityList;

    public List<ImageClassDEntity> getClassDEntityList() {
        return classDEntityList;
    }

    public void setClassDEntityList(List<ImageClassDEntity> classDEntityList) {
        this.classDEntityList = classDEntityList;
    }
}
