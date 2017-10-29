package com.cenyol.example.response;

import com.cenyol.example.model.ScoreClassDEntity;

import java.io.Serializable;
import java.util.List;

public class ScoreClassDListResponse implements Serializable {

    private List<ScoreClassDEntity> classDEntityList;

    public List<ScoreClassDEntity> getClassDEntityList() {
        return classDEntityList;
    }

    public void setClassDEntityList(List<ScoreClassDEntity> classDEntityList) {
        this.classDEntityList = classDEntityList;
    }
}
