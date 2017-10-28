package com.cenyol.example.repository;

import com.cenyol.example.model.ImageClassBEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ImageClassBRepository extends JpaRepository<ImageClassBEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  ImageClassBEntity entity WHERE entity.imageClassAId=:qImageClassAId")
    public List<ImageClassBEntity> searchClassB(@Param("qImageClassAId") Integer imageClassAId);

}