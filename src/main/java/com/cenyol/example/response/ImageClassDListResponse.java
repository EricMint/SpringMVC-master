package com.cenyol.example.response;

import com.cenyol.example.model.ImageClassCEntity;
import com.cenyol.example.model.ImageClassDEntity;

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
