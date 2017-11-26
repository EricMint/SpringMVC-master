package com.bysy.hospital.service;

import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.PatientEntity;
import com.bysy.hospital.repository.PatientRepository;
import com.bysy.hospital.request.PatientSearchRequest;
import com.bysy.hospital.response.PatientListResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mint on 11/25/17.
 */
@Service
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;

    public PatientListResponse searchPatientList(PatientSearchRequest searchRequest) {
        PatientListResponse listResponse = new PatientListResponse();
        Map<String, CriteriaInfo> params = buildSearchParam(searchRequest);
        List<PatientEntity> patientEntityList = patientRepository.findByAttributes(PatientEntity.class, params, searchRequest.getPageIndex(), searchRequest.getPageSize(), null);
        if (!CollectionUtils.isEmpty(patientEntityList)) {
            listResponse.setPatientEntityList(patientEntityList);
        }
        return listResponse;
    }

    private Map<String, CriteriaInfo> buildSearchParam(PatientSearchRequest request) {
        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        if (null != request.getPatientNumber() && request.getPatientNumber() > 0) {
            params.put("patientNumber", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getPatientNumber()));
        }
        if (!StringUtils.isEmpty(request.getRealName())) {
            params.put("realName", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getRealName()));
        }
        if (StringUtils.hasText(request.getDisease())) {
            params.put("disease", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getDisease()));
        }
        if (StringUtils.hasText(request.getEthnicity())) {
            params.put("ethnicity", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getEthnicity()));
        }
        if (null != request.getGender()) {
            params.put("gender", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, request.getGender()));
        }
        if (null != request.getMinAge()) {
            params.put("age", new CriteriaInfo(CriteriaInfo.CriteriaType.greaterThanOrEqualsForInt, request.getMinAge()));
        }
        if (null != request.getMaxAge()) {
            params.put("age", new CriteriaInfo(CriteriaInfo.CriteriaType.lessThanOrEqualsForInt, request.getMaxAge()));
        }
        if (null != request.getMinHeight()) {
            params.put("height", new CriteriaInfo(CriteriaInfo.CriteriaType.greaterThanOrEqualsForInt, request.getMinHeight()));
        }
        if (null != request.getMaxHeight()) {
            params.put("height", new CriteriaInfo(CriteriaInfo.CriteriaType.lessThanOrEqualsForInt, request.getMaxHeight()));
        }
        if (null != request.getMinWeight()) {
            params.put("weight", new CriteriaInfo(CriteriaInfo.CriteriaType.greaterThanOrEqualsForInt, request.getMinWeight()));
        }
        if (null != request.getMaxWeight()) {
            params.put("weight", new CriteriaInfo(CriteriaInfo.CriteriaType.lessThanOrEqualsForInt, request.getMaxWeight()));
        }
        return params;
    }
}
