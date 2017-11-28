package com.bysy.hospital.service;

import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.PhysicalJizhuCetujixingEntity;
import com.bysy.hospital.repository.PhysicalRepository;
import com.bysy.hospital.request.PhysicalJizhuCetujixingUpdateRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public void updateOrCreateJizhuCetujixing(PhysicalJizhuCetujixingUpdateRequest updateRequest) {
        PhysicalJizhuCetujixingEntity entity = findJizhuCetujixing(updateRequest.getPatientId());
        if (null != entity && null != entity.getId()) {
            entity.setAnswer(updateRequest.getAnswer());
            entity.setUpdateBy("system");
            entity.setUpdateTime(new Date());
            physicalRepository.update(entity);
        } else {
            PhysicalJizhuCetujixingEntity physicalJizhuCetujixingEntity = new PhysicalJizhuCetujixingEntity();
            physicalJizhuCetujixingEntity.setPatientId(updateRequest.getPatientId());
            physicalJizhuCetujixingEntity.setAnswer(updateRequest.getAnswer());
            physicalJizhuCetujixingEntity.setExamType("体格检查");
            physicalJizhuCetujixingEntity.setExamCategory("脊柱组");
            physicalJizhuCetujixingEntity.setExamName("侧突畸形");
            physicalRepository.create(physicalJizhuCetujixingEntity);
        }
    }

}
