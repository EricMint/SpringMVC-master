package com.bysy.hospital.repository;

import com.bysy.hospital.model.PhysicalClassDEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface PhysicalClassDRepository extends JpaRepository<PhysicalClassDEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  PhysicalClassDEntity entity WHERE entity.physicalClassCId=:qPhysicalClassCId")
    public List<PhysicalClassDEntity> searchClassD(@Param("qPhysicalClassCId") Integer physicalClassCId);

}