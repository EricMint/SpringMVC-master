package com.cenyol.example.response;

import com.cenyol.example.model.ImageClassBEntity;
import com.cenyol.example.model.ImageClassCEntity;

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
