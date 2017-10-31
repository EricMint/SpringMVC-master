package com.bysy.hospital.repository;

import com.bysy.hospital.model.PhysicalClassAEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PhysicalClassARepository extends JpaRepository<PhysicalClassAEntity, Integer> {
}