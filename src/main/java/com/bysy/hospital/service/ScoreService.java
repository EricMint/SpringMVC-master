package com.bysy.hospital.service;

import com.bysy.hospital.Utils.BeanUtilsEx;
import com.bysy.hospital.Utils.CriteriaInfo;
import com.bysy.hospital.model.ScoreWomacEntity;
import com.bysy.hospital.repository.ScoreRepository;
import com.bysy.hospital.request.ScoreWomacRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mint on 12/3/17.
 */
@Service
public class ScoreService {

    @Autowired
    ScoreRepository scoreRepository;

    public List<ScoreWomacEntity> getScoreWomacList(Integer patientId) {
        List<ScoreWomacEntity> entityList = new ArrayList<ScoreWomacEntity>();
        if (null != patientId) {
            Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
            params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
            entityList = scoreRepository.findByAttributes(ScoreWomacEntity.class, params, null);
        }
        return entityList;
    }

    @Transactional
    public void updateOrCreateScoreWomac(ScoreWomacRequest request) {
        Integer patientId = request.getPatientId();
        String question = request.getQuestion();
        String period = request.getPeriod();
        String level = request.getLevel();
        Integer levelScore = request.getLevelScore();
        if (null == patientId || !StringUtils.hasText(question)) {
            return;
        }
        Map<String, CriteriaInfo> params = new HashMap<String, CriteriaInfo>();
        params.put("patientId", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, patientId));
        params.put("question", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, question));
        params.put("period", new CriteriaInfo(CriteriaInfo.CriteriaType.equal, period));
        List<ScoreWomacEntity> entityList = scoreRepository.findByAttributes(ScoreWomacEntity.class, params, null);
        if (CollectionUtils.isEmpty(entityList)) {
            ScoreWomacEntity scoreWomacEntity = new ScoreWomacEntity();
            BeanUtilsEx.copyProperties(request, scoreWomacEntity);
            scoreRepository.create(scoreWomacEntity);
        } else {
            ScoreWomacEntity currentEntity = entityList.get(0);
            currentEntity.setLevel(level);
            currentEntity.setLevelScore(levelScore);
            scoreRepository.update(currentEntity);
        }


    }
}
