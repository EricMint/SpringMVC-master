package com.cenyol.example.repository;

import com.cenyol.example.model.ImagingExaminationCategoryEntity;
import com.cenyol.example.model.PatientImagingExaminationRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface ImagingExaminationCategoryRepository extends JpaRepository<ImagingExaminationCategoryEntity, Integer> {
}