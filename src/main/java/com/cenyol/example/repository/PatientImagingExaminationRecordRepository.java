package com.cenyol.example.repository;

import com.cenyol.example.model.PatientImagingExaminationRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface PatientImagingExaminationRecordRepository extends JpaRepository<PatientImagingExaminationRecordEntity, Integer> {
    @Transactional
    @Query("SELECT recordEntity FROM  PatientImagingExaminationRecordEntity recordEntity WHERE recordEntity.patientNumber=:qPatientNumber")
    public List<PatientImagingExaminationRecordEntity> searchPatientImagingExaminationRecord(@Param("qPatientNumber") Integer patientNumber);

    @Modifying
    @Transactional
    @Query("update PatientImagingExaminationRecordEntity recordEntity set recordEntity.imagingExaminationCategoryId=:qImagingExaminationCategoryId, recordEntity.imagingExaminationCategoryName=:qImagingExaminationCategoryName, " +
            "recordEntity.imagingExaminationItemId=:qImagingExaminationItemId, recordEntity.imagingExaminationItemName=:qImagingExaminationItemName, recordEntity.imagingExaminationItemOptionId=:qImagingExaminationItemOptionId, " +
            "recordEntity.imagingExaminationItemOptionId=:qImagingExaminationItemOptionId, recordEntity.imagingExaminationItemOptionName=:qImagingExaminationItemOptionName where recordEntity.userId=:qUserId")
    public void updateRecord(@Param("qImagingExaminationCategoryId") Integer imagingExaminationCategoryId,
                             @Param("qImagingExaminationCategoryName") String imagingExaminationCategoryName,
                             @Param("qImagingExaminationItemId") Integer imagingExaminationItemId,
                             @Param("qImagingExaminationItemName") String imagingExaminationItemName,
                             @Param("qImagingExaminationItemOptionId") Integer imagingExaminationItemOptionId,
                             @Param("qImagingExaminationItemOptionName") String imagingExaminationItemOptionName,
                             @Param("qUserId") Integer userId);

}