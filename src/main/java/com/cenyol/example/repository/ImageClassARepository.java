package com.cenyol.example.repository;

import com.cenyol.example.model.ImageClassAEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ImageClassARepository extends JpaRepository<ImageClassAEntity, Integer> {
}