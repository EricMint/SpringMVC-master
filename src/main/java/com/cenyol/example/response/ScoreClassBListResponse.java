package com.cenyol.example.response;

import com.cenyol.example.model.ScoreClassBEntity;

import java.io.Serializable;
import java.util.List;

public class ScoreClassBListResponse implements Serializable {

    private List<ScoreClassBEntity> classBEntityList;

    public List<ScoreClassBEntity> getClassBEntityList() {
        return classBEntityList;
    }

    public void setClassBEntityList(List<ScoreClassBEntity> classBEntityList) {
        this.classBEntityList = classBEntityList;
    }
}
