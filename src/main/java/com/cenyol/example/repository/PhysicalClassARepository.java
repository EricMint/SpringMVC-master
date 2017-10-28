package com.cenyol.example.repository;

import com.cenyol.example.model.PhysicalClassAEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PhysicalClassARepository extends JpaRepository<PhysicalClassAEntity, Integer> {
}