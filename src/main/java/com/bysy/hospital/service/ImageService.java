package com.bysy.hospital.service;

import com.bysy.hospital.Utils.BeanUtilsEx;
import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.ImageGuguceEntity;
import com.bysy.hospital.model.ImageKuanjiuceEntity;
import com.bysy.hospital.repository.ImageRepository;
import com.bysy.hospital.request.ImageGuguceRequest;
import com.bysy.hospital.request.ImageKuanjiuceRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public List<ImageKuanjiuceEntity> findKuanjiuce(Integer patientId) {
        List<ImageKuanjiuceEntity> entityList = new ArrayList<ImageKuanjiuceEntity>();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            entityList = imageRepository.findByAttributes(ImageKuanjiuceEntity.class, params, null);
        }

        return entityList;
    }

    @Transactional
    public void updateOrCreateKuanjiuce(ImageKuanjiuceRequest request) {
        Integer patientId = request.getPatientId();
        String examName = request.getExamName();
        String examResult = request.getExamResult();
        if (null == patientId || !StringUtils.hasText(examName) || !StringUtils.hasText(examResult)) {
            return;
        }

        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
        params.put("examName", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, examName));
        params.put("examResult", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, examResult));
        List<ImageKuanjiuceEntity> entityList = imageRepository.findByAttributes(ImageKuanjiuceEntity.class, params, 0, 1, null);

        if (CollectionUtils.isEmpty(entityList)) {
            ImageKuanjiuceEntity kuanjiuceEntity = new ImageKuanjiuceEntity();
            BeanUtilsEx.copyProperties(request, kuanjiuceEntity);
            kuanjiuceEntity.setExamType("影像检查");
            kuanjiuceEntity.setExamCategory("髋臼侧");
            imageRepository.create(kuanjiuceEntity);
        } else {
            ImageKuanjiuceEntity entity = entityList.get(0);
            entity.setUpdateBy("system");
            entity.setUpdateTime(new Date());
            entity.setExamResult(request.getExamResult());
            imageRepository.update(entity);
        }

    }

    public List<ImageGuguceEntity> findGuguce(Integer patientId) {
        List<ImageGuguceEntity> entityList = new ArrayList<ImageGuguceEntity>();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            entityList = imageRepository.findByAttributes(ImageGuguceEntity.class, params, null);
        }

        return entityList;
    }

    @Transactional
    public void updateOrCreateGuguce(ImageGuguceRequest request) {
        Integer patientId = request.getPatientId();
        String examName = request.getExamName();
        String hengjing = request.getHengjing();
        String shizhuangjing = request.getShizhuangjing();
        String suiqiang = request.getSuiqiang();

        if (null == patientId || !StringUtils.hasText(examName)) {
            return;
        }

        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
        params.put("examName", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, examName));
        List<ImageGuguceEntity> entityList = imageRepository.findByAttributes(ImageGuguceEntity.class, params, 0, 1, null);

        if (CollectionUtils.isEmpty(entityList)) {
            ImageGuguceEntity guguceEntity = new ImageGuguceEntity();
            BeanUtilsEx.copyProperties(request, guguceEntity);
            guguceEntity.setExamType("影像检查");
            guguceEntity.setExamCategory("股骨侧");
            imageRepository.create(guguceEntity);
        } else if (StringUtils.hasText(hengjing) || StringUtils.hasText(shizhuangjing) || StringUtils.hasText(suiqiang)) {
            ImageGuguceEntity entity = entityList.get(0);
            entity.setUpdateBy("system");
            entity.setUpdateTime(new Date());
            entity.setHengjing(hengjing);
            entity.setShizhuangjing(shizhuangjing);
            entity.setSuiqiang(suiqiang);
            imageRepository.update(entity);
        }

    }

}
