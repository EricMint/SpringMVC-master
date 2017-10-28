package com.cenyol.example.repository;

import com.cenyol.example.model.ImageRecordEntity;
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
            " imageRecordEntity.imageClassCId=:qImageClassEId, imageRecordEntity.imageClassEName=:qImageClassEName,"+
            "imageRecordEntity.result=:qResult where imageRecordEntity.imageRecordId=:qImageRecordId")
    public void updateImageRecord(@Param("qImageClassAId") Integer imageClassAId,
                                  @Param("qImageClassAName") String imageClassAName,
                                  @Param("qImageClassBId") Integer imageClassBId,
                                  @Param("qImageClassBName") String imageClassBName,
                                  @Param("qImageClassCId") Integer imageClassCId,
                                  @Param("qImageClassCName") String imageClassCName,
                                  @Param("qImageClassDId") Integer imageClassDId,
                                  @Param("qImageClassDName") String imageClassDName,
                                  @Param("qImageClassEId") Integer imageClassEId,
                                  @Param("qImageClassEName") String imageClassEName,
                                  @Param("qResult") String result,
                                  @Param("qImageRecordId") Integer imageRecordId);

}