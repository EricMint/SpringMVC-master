package com.bysy.hospital.repository;

import com.bysy.hospital.model.ScoreMarkEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ScoreMarkRepository extends JpaRepository<ScoreMarkEntity, Integer> {
    @Transactional
    @Query("SELECT scoreMarkEntity FROM  ScoreMarkEntity scoreMarkEntity WHERE scoreMarkEntity.patientId=:qPatientId")
    public List<ScoreMarkEntity> searchScoreMarkByPatientId(@Param("qPatientId") Integer patientId);

    @Transactional
    @Query("SELECT scoreMarkEntity FROM  ScoreMarkEntity scoreMarkEntity WHERE scoreMarkEntity.patientId=:qPatientId AND scoreMarkEntity.scoreClassAId=:qScoreClassAId")
    public List<ScoreMarkEntity> searchScoreMarkByPatientAndClassAId(@Param("qPatientId") Integer patientId, @Param("qScoreClassAId") Integer scoreClassAId);


    @Modifying
    @Transactional
    @Query("update ScoreMarkEntity scoreMarkEntity set scoreMarkEntity.scoreClassAId=:qScoreClassAId, scoreMarkEntity.scoreClassAName=:qScoreClassAName, " +
            "scoreMarkEntity.patientId=:qPatientId,scoreMarkEntity.result=:qResult where scoreMarkEntity.patientId=:qPatientId and scoreMarkEntity.scoreClassAId=:qScoreClassAId")
    public void updateScoreMark(@Param("qPatientId") Integer patientId,
                                @Param("qScoreClassAId") Integer scoreClassAId,
                                @Param("qScoreClassAName") String scoreClassAName,
                                @Param("qResult") String result);

}