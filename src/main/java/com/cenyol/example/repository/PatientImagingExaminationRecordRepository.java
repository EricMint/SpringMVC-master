package com.cenyol.example.repository;

import com.cenyol.example.model.PatientImagingExaminationRecordEntity;
import com.cenyol.example.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Repository // 添加注解
public interface PatientImagingExaminationRecordRepository extends JpaRepository<PatientImagingExaminationRecordEntity, Integer> {
    @Modifying // 说明该方法是修改操作
    @Transactional // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("SELECT recordEntity FROM  PatientImagingExaminationRecordEntity recordEntity WHERE recordEntity.patientNumber=:qPatientNumber")
    public List<PatientImagingExaminationRecordEntity> searchPatientImagingExaminationRecord(@Param("qPatientNumber") Integer patientNumber);
}