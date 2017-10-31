package com.bysy.hospital.repository;

import com.bysy.hospital.model.ImageClassCEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ImageClassCRepository extends JpaRepository<ImageClassCEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  ImageClassCEntity entity WHERE entity.imageClassBId=:qImageClassBId")
    public List<ImageClassCEntity> searchClassC(@Param("qImageClassBId") Integer imageClassBId);

}