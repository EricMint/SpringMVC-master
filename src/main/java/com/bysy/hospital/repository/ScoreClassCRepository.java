package com.bysy.hospital.repository;

import com.bysy.hospital.model.ScoreClassCEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ScoreClassCRepository extends JpaRepository<ScoreClassCEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  ScoreClassCEntity entity WHERE entity.scoreClassBId=:qScoreClassBId")
    public List<ScoreClassCEntity> searchClassC(@Param("qScoreClassBId") Integer scoreClassBId);

}