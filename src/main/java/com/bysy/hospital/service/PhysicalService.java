package com.bysy.hospital.service;

import com.bysy.hospital.Utils.BeanUtilsEx;
import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.PhysicalJizhuCetujixingEntity;
import com.bysy.hospital.model.PhysicalJizhuHuodongduEntity;
import com.bysy.hospital.repository.PhysicalRepository;
import com.bysy.hospital.request.PhysicalJizhuCetujixingRequest;
import com.bysy.hospital.request.PhysicalJizhuHuodongduRequest;
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
public class PhysicalService {

    @Autowired
    private PhysicalRepository physicalRepository;

    public PhysicalJizhuCetujixingEntity findJizhuCetujixing(Integer patientId) {
        PhysicalJizhuCetujixingEntity entity = new PhysicalJizhuCetujixingEntity();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            List<PhysicalJizhuCetujixingEntity> jizhuCetujixingEntityList = physicalRepository.findByAttributes(PhysicalJizhuCetujixingEntity.class, params, 0, 1, null);
            if (!CollectionUtils.isEmpty(jizhuCetujixingEntityList)) {
                entity = jizhuCetujixingEntityList.get(0);
            }
        }

        return entity;
    }

    @Transactional
    public void updateOrCreateJizhuCetujixing(PhysicalJizhuCetujixingRequest request) {
        PhysicalJizhuCetujixingEntity entity = findJizhuCetujixing(request.getPatientId());
        if (null != entity && null != entity.getId()) {
            entity.setAnswer(request.getAnswer());
            entity.setUpdateBy("system");
            entity.setUpdateTime(new Date());
            physicalRepository.update(entity);
        } else {
            PhysicalJizhuCetujixingEntity physicalJizhuCetujixingEntity = new PhysicalJizhuCetujixingEntity();
            physicalJizhuCetujixingEntity.setPatientId(request.getPatientId());
            physicalJizhuCetujixingEntity.setAnswer(request.getAnswer());
            physicalJizhuCetujixingEntity.setExamType("体格检查");
            physicalJizhuCetujixingEntity.setExamCategory("脊柱组");
            physicalJizhuCetujixingEntity.setExamName("侧突畸形");
            physicalRepository.create(physicalJizhuCetujixingEntity);
        }
    }

    public List<PhysicalJizhuHuodongduEntity> findJizhuHuodongdu(Integer patientId) {
        List<PhysicalJizhuHuodongduEntity> entityList = new ArrayList<PhysicalJizhuHuodongduEntity>();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            entityList = physicalRepository.findByAttributes(PhysicalJizhuHuodongduEntity.class, params, null);
        }
        return entityList;
    }

    public void updateOrCreateJizhuHuodongdu(PhysicalJizhuHuodongduRequest request) {
        Integer patientId = request.getPatientId();
        if (null == patientId || !StringUtils.hasText(request.getExamPosition())) {
            return;
        }
        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
        params.put("examPosition", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getExamPosition()));
        List<PhysicalJizhuHuodongduEntity> entityList = physicalRepository.findByAttributes(PhysicalJizhuHuodongduEntity.class, params, null);
        if (CollectionUtils.isEmpty(entityList)) {
            PhysicalJizhuHuodongduEntity huodongduEntity = new PhysicalJizhuHuodongduEntity();
            BeanUtilsEx.copyProperties(request, huodongduEntity);
            huodongduEntity.setExamType("体格检查");
            huodongduEntity.setExamCategory("脊柱组");
            huodongduEntity.setExamName("活动度");
            physicalRepository.create(huodongduEntity);
        } else {
            PhysicalJizhuHuodongduEntity updateEntity = entityList.get(0);
            if (StringUtils.hasText(request.getQianqu())) {
                updateEntity.setQianqu(request.getQianqu());
            }
            if (StringUtils.hasText(request.getHoushen())) {
                updateEntity.setHoushen(request.getHoushen());
            }
            if (StringUtils.hasText(request.getZuocewan())) {
                updateEntity.setZuocewan(request.getZuocewan());
            }
            if (StringUtils.hasText(request.getYoucewan())) {
                updateEntity.setYoucewan(request.getYoucewan());
            }
            if (StringUtils.hasText(request.getZuocexuan())) {
                updateEntity.setZuocexuan(request.getZuocexuan());
            }
            if (StringUtils.hasText(request.getYoucexuan())) {
                updateEntity.setYoucexuan(request.getYoucexuan());
            }
            physicalRepository.update(updateEntity);
        }

    }

}
