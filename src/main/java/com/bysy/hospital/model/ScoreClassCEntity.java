package com.bysy.hospital.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "score_class_c")
public class ScoreClassCEntity implements Serializable {
    private int scoreClassCId;
    private String scoreClassCName;
    private int scoreClassBId;
    private String scoreClassBName;
    private int scoreClassAId;
    private String scoreClassAName;

    @Id
    @GeneratedValue
    @Column(name = "score_class_c_id", nullable = false, insertable = true, updatable = true)
    public int getScoreClassCId() {
        return scoreClassCId;
    }

    public void setScoreClassCId(int scoreClassCId) {
        this.scoreClassCId = scoreClassCId;
    }

    @Basic
    @Column(name = "score_class_c_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getScoreClassCName() {
        return scoreClassCName;
    }

    public void setScoreClassCName(String scoreClassCName) {
        this.scoreClassCName = scoreClassCName;
    }

    @Basic
    @Column(name = "score_class_b_id", nullable = true, insertable = true, updatable = true, length = 200)
    public int getScoreClassBId() {
        return scoreClassBId;
    }

    public void setScoreClassBId(int scoreClassBId) {
        this.scoreClassBId = scoreClassBId;
    }

    @Basic
    @Column(name = "score_class_b_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getScoreClassBName() {
        return scoreClassBName;
    }

    public void setScoreClassBName(String scoreClassBName) {
        this.scoreClassBName = scoreClassBName;
    }

    @Basic
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
}
