package com.bysy.hospital.service;

import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.PhysicalJizhuCetujixingEntity;
import com.bysy.hospital.repository.PhysicalRepository;
import com.bysy.hospital.request.PhysicalJizhuCetujixingUpdateRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

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

    public void updateJizhuCetujixing(PhysicalJizhuCetujixingUpdateRequest updateRequest) {
        PhysicalJizhuCetujixingEntity entity = findJizhuCetujixing(updateRequest.getPatientId());
        entity.setAnswer(updateRequest.getAnswer());
        physicalRepository.update(entity);
    }

}
