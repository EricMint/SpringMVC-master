package com.cenyol.example.response;

import com.cenyol.example.model.ImageClassBEntity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

public class ImageClassBResponse implements Serializable {

    private List<ImageClassBEntity> classBEntityList;

    public List<ImageClassBEntity> getClassBEntityList() {
        return classBEntityList;
    }

    public void setClassBEntityList(List<ImageClassBEntity> classBEntityList) {
        this.classBEntityList = classBEntityList;
    }
}
