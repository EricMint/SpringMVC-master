package com.bysy.hospital.repository;

import com.bysy.hospital.model.PatientEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface PatientRepositoryDeprecated extends JpaRepository<PatientEntity, Integer> {
    @Modifying
    @Transactional
    @Query("update PatientEntity entity set entity.patientNumber=:qPatientNumber, entity.realName=:qRealName, entity.disease=:qDisease, entity.ethnicity=:qEthnicity, entity.gender=:qGender , entity.age=:qAge , entity.height=:qHeight , entity.weight=:qWeight where entity.id=:qId")
    public void updatePatient(@Param("qPatientNumber") Integer patientNumber,
                              @Param("qRealName") String realName,
                              @Param("qDisease") String disease,
                              @Param("qEthnicity") String ethnicity,
                              @Param("qGender") String gender,
                              @Param("qAge") Integer age,
                              @Param("qHeight") Integer height,
                              @Param("qWeight") Integer weight,
                              @Param("qId") Integer id);

//    @Transactional
//    @Query("SELECT entity FROM  PatientEntity entity WHERE entity.patientNumber=:qPatientNumber, entity.realName=:qRealName, entity.disease=:qDisease, entity.ethnicity=:qEthnicity, entity.gender=:qGender")
//    public List<PatientEntity> searchPatient(@Param("qPatientNumber") Integer patientNumber,
//                                             @Param("qRealName") String realName,
//                                             @Param("qDisease") String disease,
//                                             @Param("qEthnicity") String ethnicity,
//                                             @Param("qGender") String gender);

    @Transactional
    @Query("SELECT entity FROM  PatientEntity entity " +
            "WHERE ( :qPatientNumber IS NULL OR entity.patientNumber=:qPatientNumber ) " +
            "AND (:qRealName='' OR entity.realName=:qRealName ) " +
            "AND (:qDisease='' OR (entity.disease LIKE :qDisease) ) " +
            "AND (:qEthnicity='' OR entity.ethnicity=:qEthnicity ) " +
            "AND (:qGender='' OR entity.gender=:qGender) " +
            "AND (:qMinAge IS NULL OR entity.age > :qMinAge ) " +
            "AND (:qMaxAge IS NULL OR entity.age < :qMaxAge ) " +
            "AND (:qMinHeight IS NULL OR entity.height > :qMinHeight ) " +
            "AND (:qMaxHeight IS NULL OR entity.height < :qMaxHeight ) " +
            "AND (:qMinWeight IS NULL OR entity.weight > :qMinWeight ) " +
            "AND (:qMaxWeight IS NULL OR entity.weight < :qMaxWeight )")
    public List<PatientEntity> searchPatient(@Param("qPatientNumber") Integer patientNumber,
                                             @Param("qRealName") String realName,
                                             @Param("qDisease") String disease,
                                             @Param("qEthnicity") String ethnicity,
                                             @Param("qGender") String gender,
                                             @Param("qMinAge") Integer minAge,
                                             @Param("qMaxAge") Integer maxAge,
                                             @Param("qMinHeight") Integer minHeight,
                                             @Param("qMaxHeight") Integer maxHeight,
                                             @Param("qMinWeight") Integer minWeight,
                                             @Param("qMaxWeight") Integer maxWeight);
}