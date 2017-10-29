package com.cenyol.example.repository;

import com.cenyol.example.model.ScoreRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ScoreRecordRepository extends JpaRepository<ScoreRecordEntity, Integer> {
    @Transactional
    @Query("SELECT scoreRecordEntity FROM  ScoreRecordEntity scoreRecordEntity WHERE scoreRecordEntity.patientId=:qPatientId")
    public List<ScoreRecordEntity> searchScoreRecordByPatientId(@Param("qPatientId") Integer patientId);

    @Transactional
    @Query("SELECT scoreRecordEntity FROM  ScoreRecordEntity scoreRecordEntity WHERE scoreRecordEntity.patientId=:qPatientId AND scoreRecordEntity.scoreClassBId=:qScoreClassBId")
    public List<ScoreRecordEntity> searchScoreRecordByPatientAndClassBId(@Param("qPatientId") Integer patientId, @Param("qScoreClassBId") Integer scoreClassBId);


    @Modifying
    @Transactional
    @Query("update ScoreRecordEntity scoreRecordEntity set scoreRecordEntity.scoreClassAId=:qScoreClassAId, scoreRecordEntity.scoreClassAName=:qScoreClassAName, " +
            "scoreRecordEntity.patientId=:qPatientId, " +
            "scoreRecordEntity.scoreClassBId=:qScoreClassBId, scoreRecordEntity.scoreClassBName=:qScoreClassBName, " +
            "scoreRecordEntity.scoreClassCId=:qScoreClassCId, scoreRecordEntity.scoreClassCName=:qScoreClassCName " +
            "where scoreRecordEntity.scoreRecordId=:qScoreRecordId")
    public void updateScoreRecord(@Param("qPatientId") Integer patientId,
                                  @Param("qScoreClassAId") Integer scoreClassAId,
                                  @Param("qScoreClassAName") String scoreClassAName,
                                  @Param("qScoreClassBId") Integer scoreClassBId,
                                  @Param("qScoreClassBName") String scoreClassBName,
                                  @Param("qScoreClassCId") Integer scoreClassCId,
                                  @Param("qScoreClassCName") String scoreClassCName,
                                  @Param("qScoreRecordId") Integer scoreRecordId);

}