package com.cenyol.example.repository;

import com.cenyol.example.model.ImagingExaminationItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ImagingExaminationItemRepository extends JpaRepository<ImagingExaminationItemEntity, Integer> {
    @Transactional
    @Query("SELECT itemEntity FROM  ImagingExaminationItemEntity itemEntity WHERE itemEntity.imagingExaminationCategoryId=:qImagingExaminationCategoryId")
    public List<ImagingExaminationItemEntity> searchPatientImagingExaminationItem(@Param("qImagingExaminationCategoryId") Integer imagingExaminationCategoryId);
}