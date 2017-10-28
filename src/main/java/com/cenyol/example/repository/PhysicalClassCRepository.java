package com.cenyol.example.repository;

import com.cenyol.example.model.PhysicalClassCEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface PhysicalClassCRepository extends JpaRepository<PhysicalClassCEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  PhysicalClassCEntity entity WHERE entity.physicalClassBId=:qPhysicalClassBId")
    public List<PhysicalClassCEntity> searchClassC(@Param("qPhysicalClassBId") Integer physicalClassBId);

}