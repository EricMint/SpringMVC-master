package com.cenyol.example.response;

import com.cenyol.example.model.ScoreClassCEntity;

import java.io.Serializable;
import java.util.List;

public class ScoreClassCListResponse implements Serializable {

    private List<ScoreClassCEntity> classCEntityList;

    public List<ScoreClassCEntity> getClassCEntityList() {
        return classCEntityList;
    }

    public void setClassCEntityList(List<ScoreClassCEntity> classCEntityList) {
        this.classCEntityList = classCEntityList;
    }
}
