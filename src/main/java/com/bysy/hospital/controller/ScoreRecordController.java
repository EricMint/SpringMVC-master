package com.bysy.hospital.controller;

import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.*;
import com.bysy.hospital.response.ScoreClassBResponse;
import com.bysy.hospital.response.ScoreClassCListResponse;
import com.bysy.hospital.response.ScoreClassCResponse;
import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.*;
import com.bysy.hospital.response.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class ScoreRecordController {

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private ScoreRecordRepository scoreRecordRepository;

    @Autowired
    private ScoreMarkRepository scoreMarkRepository;

    @Autowired
    private ScoreClassARepository scoreClassARepository;

    @Autowired
    private ScoreClassBRepository scoreClassBRepository;

    @Autowired
    private ScoreClassCRepository scoreClassCRepository;


    // 选择评分页面
    @RequestMapping(value = "/scoreRecord/create/{patientId}", method = RequestMethod.GET)
    public String addScoreRecord(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);

        List<ScoreClassAEntity> scoreClassAEntityList = scoreClassARepository.findAll();
        modelMap.addAttribute("scoreClassAList", scoreClassAEntityList);

        return "scoreRecordCreate";
    }

    // 选择评分处理
    @RequestMapping(value = "/scoreRecord/createPost", method = RequestMethod.POST)
    public String addScoreRecordPost(@ModelAttribute("scoreRecord") ScoreRecordEntity scoreRecordEntity) {
        Integer patientId = scoreRecordEntity.getPatientId();
        Integer classAId = scoreRecordEntity.getScoreClassAId();
        return "redirect:/scoreRecord/createDetail/" + patientId + "/" + classAId;
    }

    // 具体评分页面
    @RequestMapping(value = "/scoreRecord/createDetail/{patientId}/{classAId}", method = RequestMethod.GET)
    public String addScoreRecordDetail(@PathVariable("patientId") Integer patientId, @PathVariable("classAId") Integer classAId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        List<ScoreRecordEntity> recordEntityList = scoreRecordRepository.searchScoreRecordByPatientId(patientId);
        List<ScoreClassBEntity> scoreClassBEntityList = scoreClassBRepository.searchClassB(classAId);
        List<ScoreMarkEntity> scoreMarkEntityList = scoreMarkRepository.searchScoreMarkByPatientAndClassAId(patientId, classAId);
        List<ScoreClassBResponse> classBResponseList = new ArrayList<ScoreClassBResponse>();
        for (ScoreClassBEntity classBEntity : scoreClassBEntityList) {
            ScoreClassBResponse classBResponse = new ScoreClassBResponse();
            classBResponse.setScoreClassAId(classBEntity.getScoreClassAId());
            classBResponse.setScoreClassAName(classBEntity.getScoreClassAName());
            classBResponse.setGroupLabel(classBEntity.getGroupLabel());
            classBResponse.setScoreClassBId(classBEntity.getScoreClassBId());
            classBResponse.setScoreClassBName(classBEntity.getScoreClassBName());
            Integer classBId = classBEntity.getScoreClassBId();
            List<ScoreClassCResponse> classCResponseList = getClassCResponseList(classBId, recordEntityList);
            classBResponse.setClassCResponseList(classCResponseList);
            classBResponseList.add(classBResponse);
        }
        modelMap.addAttribute("scoreClassBList", classBResponseList);
        modelMap.addAttribute("scoreClassAId", classAId);
        if (!scoreMarkEntityList.isEmpty()) {
            String result = scoreMarkEntityList.get(0).getResult();
            modelMap.addAttribute("result", result);
        }

        return "scoreRecordCreateDetail";
    }

    // 选择评分处理
    @RequestMapping(value = "/scoreRecord/createDetail/{patientId}/answer/{scoreClassCId}", method = RequestMethod.GET)
    public void answerScoreRecordPost(@PathVariable("patientId") Integer patientId, @PathVariable("scoreClassCId") Integer scoreClassCId) {
        ScoreClassCEntity classCEntity = scoreClassCRepository.findOne(scoreClassCId);
        List<ScoreRecordEntity> recordEntityList = scoreRecordRepository.searchScoreRecordByPatientAndClassBId(patientId, classCEntity.getScoreClassBId());
        if (recordEntityList.isEmpty()) {
            ScoreRecordEntity recordEntity = new ScoreRecordEntity();
            recordEntity.setPatientId(patientId);
            recordEntity.setScoreClassAId(classCEntity.getScoreClassAId());
            recordEntity.setScoreClassAName(classCEntity.getScoreClassAName());
            recordEntity.setScoreClassBId(classCEntity.getScoreClassBId());
            recordEntity.setScoreClassBName(classCEntity.getScoreClassBName());
            recordEntity.setScoreClassCId(scoreClassCId);
            recordEntity.setScoreClassCName(classCEntity.getScoreClassCName());
            ScoreRecordEntity savedEntity = scoreRecordRepository.save(recordEntity);
            scoreRecordRepository.flush();
        } else {
            ScoreRecordEntity recordEntity = recordEntityList.get(0);
            recordEntity.setScoreClassAId(classCEntity.getScoreClassAId());
            recordEntity.setScoreClassAName(classCEntity.getScoreClassAName());
            recordEntity.setScoreClassBId(classCEntity.getScoreClassBId());
            recordEntity.setScoreClassBName(classCEntity.getScoreClassBName());
            recordEntity.setScoreClassCId(classCEntity.getScoreClassCId());
            recordEntity.setScoreClassCName(classCEntity.getScoreClassCName());
            scoreRecordRepository.updateScoreRecord(
                    recordEntity.getPatientId(),
                    recordEntity.getScoreClassAId(),
                    recordEntity.getScoreClassAName(),
                    recordEntity.getScoreClassBId(),
                    recordEntity.getScoreClassBName(),
                    recordEntity.getScoreClassCId(),
                    recordEntity.getScoreClassCName(),
                    recordEntity.getScoreRecordId()
            );
            scoreRecordRepository.flush();
        }

    }

    // 评分更新处理
    @RequestMapping(value = "/scoreRecord/createScorePost", method = RequestMethod.POST)
    public String updateScoreRecordPost(@ModelAttribute("scoreMark") ScoreMarkEntity scoreMarkEntity) {
        Integer patientId = scoreMarkEntity.getPatientId();
        Integer classAId = scoreMarkEntity.getScoreClassAId();
        ScoreClassAEntity classAEntity = scoreClassARepository.findOne(classAId);
        scoreMarkEntity.setScoreClassAName(classAEntity.getScoreClassAName());
        List<ScoreMarkEntity> scoreMarkEntityList = scoreMarkRepository.searchScoreMarkByPatientAndClassAId(patientId, classAId);
        if (scoreMarkEntityList.isEmpty()) {
            ScoreMarkEntity savedScoreMarkEntity = scoreMarkRepository.save(scoreMarkEntity);
            scoreMarkRepository.flush();

        } else {
            ScoreMarkEntity oldScoreMarkEntity = scoreMarkEntityList.get(0);
            oldScoreMarkEntity.setScoreClassAName(scoreMarkEntity.getScoreClassAName());
            oldScoreMarkEntity.setResult(scoreMarkEntity.getResult());
            scoreMarkRepository.updateScoreMark(
                    oldScoreMarkEntity.getPatientId(),
                    oldScoreMarkEntity.getScoreClassAId(),
                    oldScoreMarkEntity.getScoreClassAName(),
                    oldScoreMarkEntity.getResult()
            );
            scoreRecordRepository.flush();
        }

        return "redirect:/patient/detail/isManager/" + patientId;
    }

    private List<ScoreClassCResponse> getClassCResponseList(Integer classBId, List<ScoreRecordEntity> recordEntityList) {
        Map<Integer, Boolean> recordMap = new HashMap<Integer, Boolean>();
        if (!recordEntityList.isEmpty()) {
            for (ScoreRecordEntity recordEntity : recordEntityList) {
                recordMap.put(recordEntity.getScoreClassCId(), Boolean.TRUE);
            }
        }

        List<ScoreClassCResponse> classCResponseList = new ArrayList<ScoreClassCResponse>();
        List<ScoreClassCEntity> classCEntityList = listClassC(classBId).getClassCEntityList();
        if (classCEntityList.isEmpty()) {
            return classCResponseList;
        }
        for (ScoreClassCEntity classCEntity : classCEntityList) {
            ScoreClassCResponse classCResponse = new ScoreClassCResponse();
            classCResponse.setScoreClassAId(classCEntity.getScoreClassAId());
            classCResponse.setScoreClassAName(classCEntity.getScoreClassAName());
            classCResponse.setScoreClassBId(classCEntity.getScoreClassBId());
            classCResponse.setScoreClassBName(classCEntity.getScoreClassBName());
            classCResponse.setScoreClassCId(classCEntity.getScoreClassCId());
            classCResponse.setScoreClassCName(classCEntity.getScoreClassCName());
            classCResponse.setSelected(recordMap.get(classCEntity.getScoreClassCId()));
            classCResponseList.add(classCResponse);
        }
        return classCResponseList;
    }

    @RequestMapping(value = "/score/classC/{scoreClassBId}", method = RequestMethod.GET)
    @ResponseBody
    public ScoreClassCListResponse listClassC(@PathVariable("scoreClassBId") Integer scoreClassBId) {
        List<ScoreClassCEntity> classCEntityList = scoreClassCRepository.searchClassC(scoreClassBId);
        ScoreClassCListResponse listResponse = new ScoreClassCListResponse();
        listResponse.setClassCEntityList(classCEntityList);
        return listResponse;
    }

    // 删除评分记录
    @RequestMapping(value = "/scoreMark/delete/{scoreMarkId}", method = RequestMethod.GET)
    public String deleteScoreMark(@PathVariable("scoreMarkId") Integer scoreMarkId) {
        ScoreMarkEntity scoreMarkEntity = scoreMarkRepository.findOne(scoreMarkId);
        scoreMarkRepository.delete(scoreMarkId);
        scoreMarkRepository.flush();
        return "redirect:/patient/detail/isManager/" + scoreMarkEntity.getPatientId();

    }


}