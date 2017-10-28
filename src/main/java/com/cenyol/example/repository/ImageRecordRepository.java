package com.cenyol.example.repository;

import com.cenyol.example.model.ImageRecordEntity;
import com.cenyol.example.model.PatientImagingExaminationRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ImageRecordRepository extends JpaRepository<ImageRecordEntity, Integer> {
    @Transactional
    @Query("SELECT imageRecordEntity FROM  ImageRecordEntity imageRecordEntity WHERE imageRecordEntity.patientId=:qPatientId")
    public List<ImageRecordEntity> searchImageRecord(@Param("qPatientId") Integer patientId);

    @Modifying
    @Transactional
    @Query("update ImageRecordEntity imageRecordEntity set imageRecordEntity.imageClassAId=:qImageClassAId, imageRecordEntity.imageClassAName=:qImageClassAName, " +
            "imageRecordEntity.imageClassBId=:qImageClassBId, imageRecordEntity.imageClassBName=:qImageClassBName," +
            " imageRecordEntity.imageClassCId=:qImageClassCId, imageRecordEntity.imageClassCName=:qImageClassCName," +
            " imageRecordEntity.imageClassDId=:qImageClassDId, imageRecordEntity.imageClassDName=:qImageClassDName," +
            " imageRecordEntity.imageClassCId=:qImageClassEId, imageRecordEntity.imageClassEName=:qImageClassEName where imageRecordEntity.patientId=:qPatientId")
    public void updateImageRecord(@Param("qImageClassAId") Integer imageClassAId,
                                  @Param("qImageClassAName") String imageClassAName,
                                  @Param("qImageClassBId") Integer imageClassBId,
                                  @Param("qImageClassBName") Integer imageClassBName,
                                  @Param("qImageClassCId") Integer imageClassCId,
                                  @Param("qImageClassCName") Integer imageClassCName,
                                  @Param("qImageClassDId") Integer imageClassDId,
                                  @Param("qImageClassDName") Integer imageClassDName,
                                  @Param("qImageClassEId") Integer imageClassEId,
                                  @Param("qImageClassEName") Integer imageClassEName,
                                  @Param("qPatientId") Integer patientId);

}