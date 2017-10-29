package com.cenyol.example.repository;

import com.cenyol.example.model.ScoreClassDEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ScoreClassDRepository extends JpaRepository<ScoreClassDEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  ScoreClassDEntity entity WHERE entity.scoreClassCId=:qScoreClassCId")
    public List<ScoreClassDEntity> searchClassD(@Param("qScoreClassCId") Integer scoreClassCId);

}