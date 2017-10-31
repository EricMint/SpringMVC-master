package com.bysy.hospital.response;

import com.bysy.hospital.model.ScoreClassBEntity;

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
