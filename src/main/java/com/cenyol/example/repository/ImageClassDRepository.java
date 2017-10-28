package com.cenyol.example.repository;

import com.cenyol.example.model.ImageClassCEntity;
import com.cenyol.example.model.ImageClassDEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ImageClassDRepository extends JpaRepository<ImageClassDEntity, Integer> {
    @Transactional
    @Query("SELECT entity FROM  ImageClassDEntity entity WHERE entity.imageClassCId=:qImageClassCId")
    public List<ImageClassDEntity> searchClassD(@Param("qImageClassCId") Integer imageClassCId);

}