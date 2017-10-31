package com.bysy.hospital.repository;

import com.bysy.hospital.model.ImageClassEEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ImageClassERepository extends JpaRepository<ImageClassEEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  ImageClassEEntity entity WHERE entity.imageClassDId=:qImageClassDId")
    public List<ImageClassEEntity> searchClassE(@Param("qImageClassDId") Integer imageClassDId);

}