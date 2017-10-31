package com.bysy.hospital.repository;

import com.bysy.hospital.model.ImageClassAEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ImageClassARepository extends JpaRepository<ImageClassAEntity, Integer> {
}