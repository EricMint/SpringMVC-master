package com.bysy.hospital.repository;

import com.bysy.hospital.model.PhysicalClassBEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface PhysicalClassBRepository extends JpaRepository<PhysicalClassBEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  PhysicalClassBEntity entity WHERE entity.physicalClassAId=:qPhysicalClassAId")
    public List<PhysicalClassBEntity> searchClassB(@Param("qPhysicalClassAId") Integer physicalClassAId);

}