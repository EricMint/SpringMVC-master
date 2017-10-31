package com.bysy.hospital.repository;

import com.bysy.hospital.model.ScoreClassBEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ScoreClassBRepository extends JpaRepository<ScoreClassBEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  ScoreClassBEntity entity WHERE entity.scoreClassAId=:qScoreClassAId")
    public List<ScoreClassBEntity> searchClassB(@Param("qScoreClassAId") Integer scoreClassAId);

}