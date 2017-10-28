package com.cenyol.example.repository;

import com.cenyol.example.model.PhysicalExaminationItemOptionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface PhysicalExaminationItemOptionRepository extends JpaRepository<PhysicalExaminationItemOptionEntity, Integer> {
    @Transactional
    @Query("SELECT optionEntity FROM  PhysicalExaminationItemOptionEntity optionEntity WHERE optionEntity.physicalExaminationItemId=:qPhysicalExaminationItemId")
    public List<PhysicalExaminationItemOptionEntity> searchPatientPhysicalExaminationItemOption(@Param("qPhysicalExaminationItemId") Integer physicalExaminationItemId);
}