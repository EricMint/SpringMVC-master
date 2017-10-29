package com.cenyol.example.response;

import java.io.Serializable;
import java.util.List;

public class ScoreClassCResponse implements Serializable {
    private Boolean selected;
    private int scoreClassCId;
    private String scoreClassCName;
    private int scoreClassBId;
    private String scoreClassBName;
    private int scoreClassAId;
    private String scoreClassAName;


    public Boolean getSelected() {
        return selected;
    }

    public void setSelected(Boolean selected) {
        this.selected = selected;
    }

    public int getScoreClassCId() {
        return scoreClassCId;
    }

    public void setScoreClassCId(int scoreClassCId) {
        this.scoreClassCId = scoreClassCId;
    }

    public String getScoreClassCName() {
        return scoreClassCName;
    }

    public void setScoreClassCName(String scoreClassCName) {
        this.scoreClassCName = scoreClassCName;
    }

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

}
