package com.cenyol.example.repository;

import com.cenyol.example.model.ImagingExaminationItemEntity;
import com.cenyol.example.model.ImagingExaminationItemOptionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ImagingExaminationItemOptionRepository extends JpaRepository<ImagingExaminationItemOptionEntity, Integer> {
    @Transactional
    @Query("SELECT optionEntity FROM  ImagingExaminationItemOptionEntity optionEntity WHERE optionEntity.imagingExaminationItemId=:qImagingExaminationItemId")
    public List<ImagingExaminationItemOptionEntity> searchPatientImagingExaminationItemOption(@Param("qImagingExaminationItemId") Integer imagingExaminationItemId);
}