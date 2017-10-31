package com.bysy.hospital.response;

import com.bysy.hospital.model.ScoreClassCEntity;

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
