package com.bysy.hospital.repository;


import com.bysy.hospital.Utils.CriteriaInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


public abstract class CommonRepository {

    @Autowired
    protected JPAAccess jpaAccess;

    public <T> T findOneById(Class<T> entityClass, Object id) {
        return jpaAccess.get(entityClass, id);
    }

    public <T> T findUniqueResult(CriteriaQuery<T> criteriaQuery) {
        return jpaAccess.findUniqueResult(criteriaQuery);
    }

    @Transactional
    public <T> void create(T t) {
        jpaAccess.save(t);
    }

    @Transactional
    public <T> void deleteById(Class<T> entityClass, Object id) {
        T object = findOneById(entityClass, id);
        jpaAccess.delete(object);
    }

    @Transactional
    public <T> void update(T t) {
        jpaAccess.update(t);
    }

    @Transactional
    public <T> void delete(T t) {
        jpaAccess.delete(t);
    }

}
