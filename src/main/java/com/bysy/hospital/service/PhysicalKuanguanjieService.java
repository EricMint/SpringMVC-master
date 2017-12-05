package com.bysy.hospital.service;

import com.bysy.hospital.Utils.BeanUtilsEx;
import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.PhysicalRepository;
import com.bysy.hospital.request.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * Created by mint on 12/05/17.
 */
@Service
public class PhysicalKuanguanjieService {

    @Autowired
    private PhysicalRepository physicalRepository;

    public PhysicalKuanguanjieButaiEntity findKuanguanjieButai(Integer patientId) {
        PhysicalKuanguanjieButaiEntity entity = new PhysicalKuanguanjieButaiEntity();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            List<PhysicalKuanguanjieButaiEntity> entityList = physicalRepository.findByAttributes(PhysicalKuanguanjieButaiEntity.class, params, 0, 1, null);
            if (!CollectionUtils.isEmpty(entityList)) {
                entity = entityList.get(0);
            }
        }

        return entity;
    }

    @Transactional
    public void updateOrCreateKuanguanjieButai(PhysicalKuanguanjieButaiRequest request) {
        PhysicalKuanguanjieButaiEntity entity = findKuanguanjieButai(request.getPatientId());
        if (null != entity && null != entity.getId()) {
            entity.setUpdateBy("system");
            entity.setUpdateTime(new Date());
            entity.setExamResult(request.getExamResult());
            physicalRepository.update(entity);
        } else {
            PhysicalKuanguanjieButaiEntity butaiEntity = new PhysicalKuanguanjieButaiEntity();
            BeanUtilsEx.copyProperties(request, butaiEntity);
            butaiEntity.setExamType("体格检查");
            butaiEntity.setExamCategory("髋关节");
            butaiEntity.setExamName("步态");
            physicalRepository.create(butaiEntity);
        }
    }


    public PhysicalKuanguanjieJixingEntity findKuanguanjieJixing(Integer patientId) {
        PhysicalKuanguanjieJixingEntity entity = new PhysicalKuanguanjieJixingEntity();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            List<PhysicalKuanguanjieJixingEntity> entityList = physicalRepository.findByAttributes(PhysicalKuanguanjieJixingEntity.class, params, 0, 1, null);
            if (!CollectionUtils.isEmpty(entityList)) {
                entity = entityList.get(0);
            }
        }

        return entity;
    }

    @Transactional
    public void updateOrCreateKuanguanjieJixing(PhysicalKuanguanjieJixingRequest request) {
        PhysicalKuanguanjieJixingEntity entity = findKuanguanjieJixing(request.getPatientId());
        Integer hasSymptom = request.getHasSymptom();
        if (null != entity && null != entity.getId()) {
            entity.setHasSymptom(hasSymptom);
            entity.setUpdateBy("system");
            entity.setUpdateTime(new Date());
            if (hasSymptom == 1) {
                entity.setNeishou(request.getNeishou());
                entity.setWaizhan(request.getWaizhan());
                entity.setXuanzhuan(request.getXuanzhuan());
            } else {
                entity.setNeishou("");
                entity.setWaizhan("");
                entity.setXuanzhuan("");
            }
            physicalRepository.update(entity);
        } else {
            PhysicalKuanguanjieJixingEntity jixingEntity = new PhysicalKuanguanjieJixingEntity();
            BeanUtilsEx.copyProperties(request, jixingEntity);
            jixingEntity.setExamType("体格检查");
            jixingEntity.setExamCategory("髋关节");
            jixingEntity.setExamName("畸形");
            physicalRepository.create(jixingEntity);
        }
    }

    public PhysicalKuanguanjieYatongEntity findKuanguanjieYatong(Integer patientId) {
        PhysicalKuanguanjieYatongEntity entity = new PhysicalKuanguanjieYatongEntity();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            List<PhysicalKuanguanjieYatongEntity> entityList = physicalRepository.findByAttributes(PhysicalKuanguanjieYatongEntity.class, params, 0, 1, null);
            if (!CollectionUtils.isEmpty(entityList)) {
                entity = entityList.get(0);
            }
        }

        return entity;
    }

    @Transactional
    public void updateOrCreateKuanguanjieYatong(PhysicalKuanguanjieYatongRequest request) {
        PhysicalKuanguanjieYatongEntity entity = findKuanguanjieYatong(request.getPatientId());
        Integer hasSymptom = request.getHasSymptom();
        if (null != entity && null != entity.getId()) {
            entity.setHasSymptom(hasSymptom);
            entity.setUpdateBy("system");
            entity.setUpdateTime(new Date());
            if (hasSymptom == 1) {
                entity.setExamResult(request.getExamResult());
            } else {
                entity.setExamResult("");
            }
            physicalRepository.update(entity);
        } else {
            PhysicalKuanguanjieYatongEntity yatongEntity = new PhysicalKuanguanjieYatongEntity();
            BeanUtilsEx.copyProperties(request, yatongEntity);
            yatongEntity.setExamType("体格检查");
            yatongEntity.setExamCategory("髋关节");
            yatongEntity.setExamName("压痛");
            physicalRepository.create(yatongEntity);
        }
    }

    public PhysicalKuanguanjieHuodongduEntity findKuanguanjieHuodongdu(Integer patientId) {
        PhysicalKuanguanjieHuodongduEntity entity = new PhysicalKuanguanjieHuodongduEntity();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            List<PhysicalKuanguanjieHuodongduEntity> entityList = physicalRepository.findByAttributes(PhysicalKuanguanjieHuodongduEntity.class, params, null);
            if (!CollectionUtils.isEmpty(entityList)) {
                entity = entityList.get(0);
            }
        }

        return entity;
    }

    public void updateOrCreateKuanguanjieHuodongdu(PhysicalKuanguanjieHuodongduRequest request) {
        Integer patientId = request.getPatientId();
        if (null == patientId) {
            return;
        }
        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
        List<PhysicalKuanguanjieHuodongduEntity> entityList = physicalRepository.findByAttributes(PhysicalKuanguanjieHuodongduEntity.class, params, null);
        if (CollectionUtils.isEmpty(entityList)) {
            PhysicalKuanguanjieHuodongduEntity huodongduEntity = new PhysicalKuanguanjieHuodongduEntity();
            BeanUtilsEx.copyProperties(request, huodongduEntity);
            huodongduEntity.setExamType("体格检查");
            huodongduEntity.setExamCategory("髋关节");
            huodongduEntity.setExamName("活动度");
            physicalRepository.create(huodongduEntity);
        } else {
            PhysicalKuanguanjieHuodongduEntity updateEntity = entityList.get(0);
            if (StringUtils.hasText(request.getQuqu())) {
                updateEntity.setQuqu(request.getQuqu());
            }
            if (StringUtils.hasText(request.getHoushen())) {
                updateEntity.setHoushen(request.getHoushen());
            }
            if (StringUtils.hasText(request.getNeixuan())) {
                updateEntity.setNeixuan(request.getNeixuan());
            }
            if (StringUtils.hasText(request.getWaixuan())) {
                updateEntity.setWaixuan(request.getWaixuan());
            }
            if (StringUtils.hasText(request.getNeishou())) {
                updateEntity.setNeishou(request.getNeishou());
            }
            if (StringUtils.hasText(request.getWaizhan())) {
                updateEntity.setWaizhan(request.getWaizhan());
            }
            physicalRepository.update(updateEntity);
        }

    }

    public List<PhysicalKuanguanjieShiyanEntity> findKuanguanjieShiyan(Integer patientId) {
        List<PhysicalKuanguanjieShiyanEntity> entityList = new ArrayList<PhysicalKuanguanjieShiyanEntity>();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            entityList = physicalRepository.findByAttributes(PhysicalKuanguanjieShiyanEntity.class, params, null);
        }
        return entityList;
    }

    public void updateOrCreateKuanguanjieShiyan(PhysicalKuanguanjieShiyanRequest request) {
        Integer patientId = request.getPatientId();
        String examName = request.getExamName();
        String examResult = request.getExamResult();
        if (null == patientId || !StringUtils.hasText(examName) || !StringUtils.hasText(examResult)) {
            return;
        }
        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
        params.put("examName", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, examName));
        List<PhysicalKuanguanjieShiyanEntity> entityList = physicalRepository.findByAttributes(PhysicalKuanguanjieShiyanEntity.class, params, null);
        if (CollectionUtils.isEmpty(entityList)) {
            PhysicalKuanguanjieShiyanEntity shiyanEntity = new PhysicalKuanguanjieShiyanEntity();
            BeanUtilsEx.copyProperties(request, shiyanEntity);
            shiyanEntity.setExamType("体格检查");
            shiyanEntity.setExamCategory("髋关节");
            physicalRepository.create(shiyanEntity);
        } else {
            PhysicalKuanguanjieShiyanEntity updateEntity = entityList.get(0);
            updateEntity.setExamResult(examResult);
            physicalRepository.update(updateEntity);
        }

    }


}
