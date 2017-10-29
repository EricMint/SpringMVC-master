package com.cenyol.example.repository;

import com.cenyol.example.model.ScoreClassAEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ScoreClassARepository extends JpaRepository<ScoreClassAEntity, Integer> {
}