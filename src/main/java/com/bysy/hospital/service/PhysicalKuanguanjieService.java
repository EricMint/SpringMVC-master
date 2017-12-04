package com.bysy.hospital.service;

import com.bysy.hospital.Utils.BeanUtilsEx;
import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.PhysicalKuanguanjieJixingEntity;
import com.bysy.hospital.repository.PhysicalRepository;
import com.bysy.hospital.request.PhysicalKuanguanjieJixingRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mint on 12/05/17.
 */
@Service
public class PhysicalKuanguanjieService {

    @Autowired
    private PhysicalRepository physicalRepository;

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

}
