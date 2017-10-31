package com.bysy.hospital.response;

import java.io.Serializable;
import java.util.List;

public class ScoreClassBResponse implements Serializable {
    private int scoreClassBId;
    private String scoreClassBName;
    private String groupLabel;
    private int scoreClassAId;
    private String scoreClassAName;

    private List<ScoreClassCResponse> classCResponseList;


    public int getScoreClassBId() {
        return scoreClassBId;
    }

    public void setScoreClassBId(int scoreClassBId) {
        this.scoreClassBId = scoreClassBId;
    }

    public String getScoreClassBName() {
        return scoreClassBName;
    }

    public void setScoreClassBName(String scoreClassBName) {
        this.scoreClassBName = scoreClassBName;
    }

    public String getGroupLabel() {
        return groupLabel;
    }

    public void setGroupLabel(String groupLabel) {
        this.groupLabel = groupLabel;
    }

    public int getScoreClassAId() {
        return scoreClassAId;
    }

    public void setScoreClassAId(int scoreClassAId) {
        this.scoreClassAId = scoreClassAId;
    }

    public String getScoreClassAName() {
        return scoreClassAName;
    }

    public void setScoreClassAName(String scoreClassAName) {
        this.scoreClassAName = scoreClassAName;
    }

    public List<ScoreClassCResponse> getClassCResponseList() {
        return classCResponseList;
    }

    public void setClassCResponseList(List<ScoreClassCResponse> classCResponseList) {
        this.classCResponseList = classCResponseList;
    }
}
