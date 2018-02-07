package com.bysy.hospital.service;

import com.bysy.hospital.Utils.BeanUtilsEx;
import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.ImageRepository;
import com.bysy.hospital.repository.PhysicalRepository;
import com.bysy.hospital.request.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * Created by mint on 11/25/17.
 */
@Service
public class ImageJizhuService {


    @Autowired
    private ImageRepository imageRepository;

    public List<ImageJizhuEntity> findJizhuEntityList(Integer patientId) {
        List<ImageJizhuEntity> entityList = new ArrayList<ImageJizhuEntity>();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            entityList = imageRepository.findByAttributes(ImageJizhuEntity.class, params, null);
        }
        return entityList;
    }

    public void updateOrCreateJizhu(ImageJizhuRequest request) {
        Integer patientId = request.getPatientId();
        if (null == patientId || !StringUtils.hasText(request.getExamPosition())) {
            return;
        }
        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
        params.put("examPosition", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getExamPosition()));
        params.put("examName", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getExamName()));
        List<ImageJizhuEntity> entityList = imageRepository.findByAttributes(ImageJizhuEntity.class, params, null);
        if (CollectionUtils.isEmpty(entityList)) {
            ImageJizhuEntity newEntity = new ImageJizhuEntity();
            BeanUtilsEx.copyProperties(request, newEntity);
            newEntity.setExamType("影像检查");
            imageRepository.create(newEntity);
        } else {
            ImageJizhuEntity updateEntity = entityList.get(0);
            updateEntity.setExamResult(request.getExamResult());
            imageRepository.update(updateEntity);
        }

    }

}
