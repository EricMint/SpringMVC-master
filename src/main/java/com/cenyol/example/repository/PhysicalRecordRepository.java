package com.cenyol.example.repository;

import com.cenyol.example.model.PhysicalRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface PhysicalRecordRepository extends JpaRepository<PhysicalRecordEntity, Integer> {
    @Transactional
    @Query("SELECT physicalRecordEntity FROM  PhysicalRecordEntity physicalRecordEntity WHERE physicalRecordEntity.patientId=:qPatientId")
    public List<PhysicalRecordEntity> searchPhysicalRecord(@Param("qPatientId") Integer patientId);

    @Modifying
    @Transactional
    @Query("update PhysicalRecordEntity physicalRecordEntity set physicalRecordEntity.physicalClassAId=:qPhysicalClassAId, physicalRecordEntity.physicalClassAName=:qPhysicalClassAName, " +
            "physicalRecordEntity.physicalClassBId=:qPhysicalClassBId, physicalRecordEntity.physicalClassBName=:qPhysicalClassBName," +
            " physicalRecordEntity.physicalClassCId=:qPhysicalClassCId, physicalRecordEntity.physicalClassCName=:qPhysicalClassCName," +
            " physicalRecordEntity.physicalClassDId=:qPhysicalClassDId, physicalRecordEntity.physicalClassDName=:qPhysicalClassDName," +
            "physicalRecordEntity.result=:qResult where physicalRecordEntity.physicalRecordId=:qPhysicalRecordId")
    public void updatePhysicalRecord(@Param("qPhysicalClassAId") Integer physicalClassAId,
                                  @Param("qPhysicalClassAName") String physicalClassAName,
                                  @Param("qPhysicalClassBId") Integer physicalClassBId,
                                  @Param("qPhysicalClassBName") String physicalClassBName,
                                  @Param("qPhysicalClassCId") Integer physicalClassCId,
                                  @Param("qPhysicalClassCName") String physicalClassCName,
                                  @Param("qPhysicalClassDId") Integer physicalClassDId,
                                  @Param("qPhysicalClassDName") String physicalClassDName,
                                  @Param("qResult") String result,
                                  @Param("qPhysicalRecordId") Integer physicalRecordId);

}