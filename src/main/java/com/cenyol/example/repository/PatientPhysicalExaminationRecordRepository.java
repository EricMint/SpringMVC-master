package com.cenyol.example.repository;

import com.cenyol.example.model.PatientPhysicalExaminationRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface PatientPhysicalExaminationRecordRepository extends JpaRepository<PatientPhysicalExaminationRecordEntity, Integer> {
    @Transactional
    @Query("SELECT recordEntity FROM  PatientPhysicalExaminationRecordEntity recordEntity WHERE recordEntity.patientNumber=:qPatientNumber")
    public List<PatientPhysicalExaminationRecordEntity> searchPatientPhysicalExaminationRecord(@Param("qPatientNumber") Integer patientNumber);

    @Modifying
    @Transactional
    @Query("update PatientPhysicalExaminationRecordEntity recordEntity set recordEntity.physicalExaminationCategoryId=:qPhysicalExaminationCategoryId, recordEntity.physicalExaminationCategoryName=:qPhysicalExaminationCategoryName, " +
            "recordEntity.physicalExaminationItemId=:qPhysicalExaminationItemId, recordEntity.physicalExaminationItemName=:qPhysicalExaminationItemName, recordEntity.physicalExaminationItemOptionId=:qPhysicalExaminationItemOptionId, " +
            "recordEntity.physicalExaminationItemOptionId=:qPhysicalExaminationItemOptionId, recordEntity.physicalExaminationItemOptionName=:qPhysicalExaminationItemOptionName, " +
            "recordEntity.physicalExaminationItemOptionSubId=:qPhysicalExaminationItemOptionSubId, recordEntity.physicalExaminationItemOptionSubName=:qPhysicalExaminationItemOptionSubName where recordEntity.userId=:qUserId")
    public void updateRecord(@Param("qPhysicalExaminationCategoryId") Integer physicalExaminationCategoryId,
                             @Param("qPhysicalExaminationCategoryName") String physicalExaminationCategoryName,
                             @Param("qPhysicalExaminationItemId") Integer physicalExaminationItemId,
                             @Param("qPhysicalExaminationItemName") String physicalExaminationItemName,
                             @Param("qPhysicalExaminationItemOptionId") Integer physicalExaminationItemOptionId,
                             @Param("qPhysicalExaminationItemOptionName") String physicalExaminationItemOptionName,
                             @Param("qPhysicalExaminationItemOptionSubId") Integer physicalExaminationItemOptionSubId,
                             @Param("qPhysicalExaminationItemOptionSubName") String physicalExaminationItemOptionSubName,
                             @Param("qUserId") Integer userId);

}