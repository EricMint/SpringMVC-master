package com.cenyol.example.repository;

import com.cenyol.example.model.PhysicalExaminationCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PhysicalExaminationCategoryRepository extends JpaRepository<PhysicalExaminationCategoryEntity, Integer> {
}