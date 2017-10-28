package com.cenyol.example.response;

import com.cenyol.example.model.ImageClassDEntity;
import com.cenyol.example.model.ImageClassEEntity;

import java.io.Serializable;
import java.util.List;

public class ImageClassEListResponse implements Serializable {

    private List<ImageClassEEntity> classEEntityList;

    public List<ImageClassEEntity> getClassEEntityList() {
        return classEEntityList;
    }

    public void setClassEEntityList(List<ImageClassEEntity> classEEntityList) {
        this.classEEntityList = classEEntityList;
    }
}
