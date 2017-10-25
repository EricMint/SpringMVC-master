package com.cenyol.example.repository;

import com.cenyol.example.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    @Modifying // 说明该方法是修改操作
    @Transactional // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update UserEntity entity set entity.patientNumber=:qPatientNumber, entity.idNumber=:qIdNumber, entity.realName=:qRealName, entity.ethnicity=:qEthnicity, entity.gender=:qGender , entity.age=:qAge , entity.height=:qHeight , entity.weight=:qWeight where entity.id=:qId")
    public void updateUser(@Param("qPatientNumber") Integer patientNumber,
                           @Param("qIdNumber") String idNumber,
                           @Param("qRealName") String realName,
                           @Param("qEthnicity") String ethnicity,
                           @Param("qGender") String gender,
                           @Param("qAge") Integer age,
                           @Param("qHeight") Integer height,
                           @Param("qWeight") Integer weight,
                           @Param("qId") Integer id);
}