package com.cenyol.example.model;

import javax.persistence.*;

@Entity
@Table(name = "score_class_a")
public class ScoreClassAEntity {
    private int scoreClassAId;
    private String scoreClassAName;
    private String result;

    @Id
    @GeneratedValue
    @Column(name = "score_class_a_id", nullable = false, insertable = true, updatable = true)
    public int getScoreClassAId() {
        return scoreClassAId;
    }

    public void setScoreClassAId(int scoreClassAId) {
        this.scoreClassAId = scoreClassAId;
    }

    @Basic
    @Column(name = "score_class_a_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getScoreClassAName() {
        return scoreClassAName;
    }

    public void setScoreClassAName(String scoreClassAName) {
        this.scoreClassAName = scoreClassAName;
    }

    @Basic
    @Column(name = "result", nullable = true, insertable = true, updatable = true, length = 200)
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
