package com.bysy.hospital.Utils;

import java.util.HashMap;
import java.util.Map;

public class CriteriaInfo {

    private CriteriaType criteriaType;

    private Object firstValue;

    private Object secondValue;

    public CriteriaInfo() {
    }

    public CriteriaInfo(CriteriaType criteriaType) {
        this.criteriaType = criteriaType;
    }

    public CriteriaInfo(CriteriaType criteriaType, Object firstValue) {
        this.criteriaType = criteriaType;
        this.firstValue = firstValue;
    }

    public CriteriaInfo(CriteriaType criteriaType, Object firstValue, Object secondValue) {
        this.criteriaType = criteriaType;
        this.firstValue = firstValue;
        this.secondValue = secondValue;
    }

    public CriteriaType getCriteriaType() {
        return criteriaType;
    }

    public void setCriteriaType(CriteriaType criteriaType) {
        this.criteriaType = criteriaType;
    }

    public Object getFirstValue() {
        return firstValue;
    }

    public void setFirstValue(Object firstValue) {
        this.firstValue = firstValue;
    }

    public Object getSecondValue() {
        return secondValue;
    }

    public void setSecondValue(Object secondValue) {
        this.secondValue = secondValue;
    }

    public enum CriteriaType {
//        equal,
//        notEqual,
//        betweenForDate,
//        greaterThan,
//        greaterThanForDate,
//        greaterThanOrEqualsForDate,
//        lessThanForDate,
//        isNull,
//        isNotNull,
//        in,
//        like,
//        lessThanForInt,
        equal,
        notEqual,
        betweenForInt,
        betweenForDate,
        greaterThanForInt,
        greaterThanOrEqualsForInt,
        greaterThanForDate,
        lessThanForDate,
        lessThanForInt,
        lessThanOrEqualsForInt,
        isNull,
        in,
        like;
    }

    public static Map<String, CriteriaInfo> equalCustomerId(Integer customerId) {
        Map<String, CriteriaInfo> attributes = new HashMap<String, CriteriaInfo>();
        CriteriaInfo criteriaInfo = new CriteriaInfo(CriteriaInfo.CriteriaType.equal, customerId);
        attributes.put("customerId", criteriaInfo);
        return attributes;
    }
}
