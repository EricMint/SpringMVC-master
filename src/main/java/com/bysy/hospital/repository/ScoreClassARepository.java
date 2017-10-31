package com.bysy.hospital.repository;

import com.bysy.hospital.model.ScoreClassAEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ScoreClassARepository extends JpaRepository<ScoreClassAEntity, Integer> {
}