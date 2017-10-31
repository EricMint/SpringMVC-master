package com.bysy.hospital.repository;

import com.bysy.hospital.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    @Transactional
    @Query("SELECT userEntity FROM  UserEntity userEntity WHERE userEntity.userName=:qUserName AND userEntity.password=:qPassword")
    public List<UserEntity> searchUserByPassword(@Param("qUserName") String userName, @Param("qPassword") String password);

    @Transactional
    @Query("SELECT userEntity FROM  UserEntity userEntity WHERE userEntity.userName=:qUserName")
    public List<UserEntity> searchUserByUserName(@Param("qUserName") String userName);

}