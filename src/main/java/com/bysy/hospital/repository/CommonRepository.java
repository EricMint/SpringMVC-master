package com.bysy.hospital.repository;


import com.bysy.hospital.Utils.CriteriaInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


public abstract class CommonRepository {

    public static final String ORDER_BY_ASC_NULLS_LAST = "ASC NULLS LAST";

    private static final Integer DEFAULT_PAGE_INDEX = 0;

    private static final Integer DEFAULT_PAGE_SIZE = 10;

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

    public <T> Integer findCountByAttributes(Class<T> clazz, Map<String, CriteriaInfo> attributes) {
        CriteriaBuilder builder = jpaAccess.criteriaBuilder();
        CriteriaQuery<Long> query = builder.createQuery(Long.class);
        Root<T> root = query.from(clazz);
        query.select(builder.count(root));
        buildWhere(builder, root, query, attributes, null);

        return jpaAccess.findUniqueResult(query).intValue();
    }

    //分页查询
    public <T> List<T> findByAttributes(Class<T> clazz, Map<String, CriteriaInfo> attributes, Integer pageIndex, Integer pageSize, Map<String, String> orderMap) {
        final CriteriaBuilder builder = jpaAccess.criteriaBuilder();
        final CriteriaQuery<T> query = builder.createQuery(clazz);
        final Root<T> root = query.from(clazz);
        buildWhere(builder, root, query, attributes, orderMap);

        int offset = DEFAULT_PAGE_INDEX;
        int fetchSize = DEFAULT_PAGE_SIZE;
        if (null != pageIndex && 0 < pageIndex.intValue()) {
            offset = pageIndex.intValue();
        }
        if (null != pageSize && 0 < pageSize.intValue()) {
            fetchSize = pageSize.intValue();
        }
        offset *= fetchSize;

        return jpaAccess.find(query, offset, fetchSize);
    }

    //不分页查询
    public <T> List<T> findByAttributes(Class<T> clazz, Map<String, CriteriaInfo> attributes, Map<String, String> orderMap) {
        final CriteriaBuilder builder = jpaAccess.criteriaBuilder();
        final CriteriaQuery<T> query = builder.createQuery(clazz);
        final Root<T> root = query.from(clazz);
        buildWhere(builder, root, query, attributes, orderMap);
        return jpaAccess.find(query);
    }

    private <T, S> void buildWhere(CriteriaBuilder builder, Root<T> root, CriteriaQuery<S> query, Map<String, CriteriaInfo> attributes, Map<String, String> orderMap) {
        if (!CollectionUtils.isEmpty(attributes)) {
            List<Predicate> predicates = new ArrayList<Predicate>();
            for (Map.Entry<String, CriteriaInfo> entry : attributes.entrySet()) {
                CriteriaInfo criteriaInfo = entry.getValue();
                if (CriteriaInfo.CriteriaType.betweenForDate.equals(criteriaInfo.getCriteriaType())) {
//                    predicates.add(builder.between(root.<Date>get(entry.getKey()), new Date((long) criteriaInfo.getFirstValue()), new Date((long) criteriaInfo.getSecondValue())));
                } else if (CriteriaInfo.CriteriaType.equal.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.equal(root.get(entry.getKey()), criteriaInfo.getFirstValue()));
                } else if (CriteriaInfo.CriteriaType.notEqual.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.notEqual(root.get(entry.getKey()), criteriaInfo.getFirstValue()));
                } else if (CriteriaInfo.CriteriaType.like.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.like(root.<String>get(entry.getKey()), criteriaInfo.getFirstValue() + "%"));
                } else if (CriteriaInfo.CriteriaType.in.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.in(root.get(entry.getKey())).value(criteriaInfo.getFirstValue()));
                } else if (CriteriaInfo.CriteriaType.lessThanForDate.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.lessThan(root.<Date>get(entry.getKey()), (Date) criteriaInfo.getFirstValue()));
                } else if (CriteriaInfo.CriteriaType.betweenForInt.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.between(root.<Integer>get(entry.getKey()), (Integer) criteriaInfo.getFirstValue(), (Integer) criteriaInfo.getSecondValue()));
                } else if (CriteriaInfo.CriteriaType.lessThanForInt.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.lessThan(root.<Integer>get(entry.getKey()), (Integer) criteriaInfo.getFirstValue()));
                } else if (CriteriaInfo.CriteriaType.lessThanOrEqualsForInt.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.lessThanOrEqualTo(root.<Integer>get(entry.getKey()), (Integer) criteriaInfo.getFirstValue()));
                } else if (CriteriaInfo.CriteriaType.greaterThanForInt.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.greaterThan(root.<Integer>get(entry.getKey()), (Integer) criteriaInfo.getFirstValue()));
                } else if (CriteriaInfo.CriteriaType.greaterThanOrEqualsForInt.equals(criteriaInfo.getCriteriaType())) {
                    predicates.add(builder.greaterThanOrEqualTo(root.<Integer>get(entry.getKey()), (Integer) criteriaInfo.getFirstValue()));
                }
            }
            query.where(predicates.toArray(new Predicate[predicates.size()]));
        }

        if (!CollectionUtils.isEmpty(orderMap)) {
            query.orderBy(getQueryOrderList(builder, root, orderMap));
        }
    }

    private <T> List<Order> getQueryOrderList(CriteriaBuilder builder, Root<T> root, Map<String, String> orderMap) {
        List<Order> orderList = new ArrayList<Order>();
        for (Map.Entry<String, String> entry : orderMap.entrySet()) {
            if ("desc".equalsIgnoreCase(entry.getValue())) {
                orderList.add(builder.desc(root.get(entry.getKey())));
            } else if (ORDER_BY_ASC_NULLS_LAST.equalsIgnoreCase(entry.getValue())) {
                Expression expression = root.get(entry.getKey());
                Expression nullsLast = builder.selectCase()
                        .when(expression.isNull(), 1)
                        .otherwise(0);
                orderList.add(builder.asc(nullsLast));
                orderList.add(builder.asc(expression));
            } else {
                orderList.add(builder.asc(root.get(entry.getKey())));
            }
        }
        return orderList;
    }

}
