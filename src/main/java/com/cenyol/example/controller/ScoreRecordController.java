package com.cenyol.example.controller;

import com.cenyol.example.model.*;
import com.cenyol.example.repository.*;
import com.cenyol.example.response.*;
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

    @Autowired
    private ScoreClassDRepository scoreClassDRepository;


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
        if (classAId != 0) {
//            ScoreClassAEntity classAEntity = scoreClassARepository.findOne(classAId);
//            scoreRecordEntity.setScoreClassAName(classAEntity.getScoreClassAName());
        }
//        Integer classBId = scoreRecordEntity.getScoreClassBId();
//        if (null != classBId) {
//            ScoreClassBEntity classBEntity = scoreClassBRepository.findOne(classBId);
//            scoreRecordEntity.setScoreClassBName(classBEntity.getScoreClassBName());
//
//        }
//        Integer classCId = scoreRecordEntity.getScoreClassCId();
//        if (null != classCId) {
//            ScoreClassCEntity classCEntity = scoreClassCRepository.findOne(classCId);
//            scoreRecordEntity.setScoreClassCName(classCEntity.getScoreClassCName());
//        }
//        Integer classDId = scoreRecordEntity.getScoreClassDId();
//        if (null != classDId) {
//            ScoreClassDEntity classDEntity = scoreClassDRepository.findOne(classDId);
//            scoreRecordEntity.setScoreClassDName(classDEntity.getScoreClassDName());
//        }
//        ScoreRecordEntity savedEntity = scoreRecordRepository.save(scoreRecordEntity);
//        scoreRecordRepository.flush();
//        Integer scoreRecordId = savedEntity.getScoreRecordId();
//        return "redirect:/scoreRecord/createDetail/" + scoreRecordId;
        return "redirect:/scoreRecord/createDetail/" + patientId + "/" + classAId;
    }

    // 具体评分页面
    @RequestMapping(value = "/scoreRecord/createDetail/{patientId}/{classAId}", method = RequestMethod.GET)
    public String addScoreRecordDetail(@PathVariable("patientId") Integer patientId, @PathVariable("classAId") Integer classAId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        List<ScoreRecordEntity> recordEntityList = scoreRecordRepository.searchScoreRecordByPatientId(patientId);
        List<ScoreClassBEntity> scoreClassBEntityList = scoreClassBRepository.searchClassB(classAId);
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

        return "scoreRecordCreateDetail";
    }

//    @RequestMapping(value = "/scoreRecord/createDetail/{scoreRecordId}", method = RequestMethod.GET)
//    public String addScoreRecordDetail(@PathVariable("scoreRecordId") Integer scoreRecordId, ModelMap modelMap) {
//        ScoreRecordEntity scoreRecordEntity = scoreRecordRepository.findOne(scoreRecordId);
//        modelMap.addAttribute("scoreRecordId", scoreRecordEntity.getScoreRecordId());
//        PatientEntity patientEntity = patientRepository.findOne(scoreRecordEntity.getPatientId());
//        modelMap.addAttribute("patient", patientEntity);
//
//        List<ScoreClassBEntity> scoreClassBEntityList = scoreClassBRepository.findAll();
//        List<ScoreClassBResponse> classBResponseList = new ArrayList<ScoreClassBResponse>();
//        for (ScoreClassBEntity classBEntity : scoreClassBEntityList) {
//            ScoreClassBResponse classBResponse = new ScoreClassBResponse();
//            classBResponse.setScoreClassAId(classBEntity.getScoreClassAId());
//            classBResponse.setScoreClassAName(classBEntity.getScoreClassAName());
//            classBResponse.setGroupLabel(classBEntity.getGroupLabel());
//            classBResponse.setScoreClassBId(classBEntity.getScoreClassBId());
//            classBResponse.setScoreClassBName(classBEntity.getScoreClassBName());
//            Integer classBId = classBEntity.getScoreClassBId();
//            List<ScoreClassCResponse> classCResponseList = getClassCResponseList(classBId);
//            classBResponse.setClassCResponseList(classCResponseList);
//            classBResponseList.add(classBResponse);
//        }
//        modelMap.addAttribute("scoreClassBList", classBResponseList);
//        return "scoreRecordCreateDetail";
//    }

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

        return "redirect:/patient/detail/" + patientId;
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
//            List<ScoreClassDResponse> classDResponseList = getClassDResponseList(classCEntity.getScoreClassCId());
//            classCResponse.setClassDResponseList(classDResponseList);
            classCResponseList.add(classCResponse);
        }
        return classCResponseList;
    }

//    private List<ScoreClassDResponse> getClassDResponseList(Integer classCId) {
//        List<ScoreClassDResponse> classDResponseList = new ArrayList<ScoreClassDResponse>();
//        List<ScoreClassDEntity> classDEntityList = listClassD(classCId).getClassDEntityList();
//        if (classDEntityList.isEmpty()) {
//            return classDResponseList;
//        }
//        for (ScoreClassDEntity classDEntity : classDEntityList) {
//            ScoreClassDResponse classDResponse = new ScoreClassDResponse();
//            classDResponse.setScoreClassAId(classDEntity.getScoreClassAId());
//            classDResponse.setScoreClassAName(classDEntity.getScoreClassAName());
//            classDResponse.setScoreClassBId(classDEntity.getScoreClassBId());
//            classDResponse.setScoreClassBName(classDEntity.getScoreClassBName());
//            classDResponse.setScoreClassCId(classDEntity.getScoreClassCId());
//            classDResponse.setScoreClassCName(classDEntity.getScoreClassCName());
//            classDResponse.setScoreClassDId(classDEntity.getScoreClassDId());
//            classDResponse.setScoreClassDName(classDEntity.getScoreClassDName());
//            classDResponseList.add(classDResponse);
//        }
//
//        return classDResponseList;
//    }


    // 影像检查部位更新页面
    @RequestMapping(value = "/scoreRecord/update/{scoreRecordId}", method = RequestMethod.GET)
    public String updateScoreRecord(@PathVariable("scoreRecordId") Integer scoreRecordId, ModelMap modelMap) {
        ScoreRecordEntity scoreRecordEntity = scoreRecordRepository.findOne(scoreRecordId);
        modelMap.addAttribute("scoreRecord", scoreRecordEntity);
        Integer patientId = scoreRecordEntity.getPatientId();
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        List<ScoreClassAEntity> scoreClassAEntityList = scoreClassARepository.findAll();
        modelMap.addAttribute("scoreClassAList", scoreClassAEntityList);

        Integer classAId = scoreRecordEntity.getScoreClassAId();
        if (null != classAId) {
            List<ScoreClassBEntity> classBEntityList = listClassB(classAId).getClassBEntityList();
            modelMap.addAttribute("scoreClassBList", classBEntityList);
        }
        Integer classBId = scoreRecordEntity.getScoreClassBId();
        if (null != classBId) {
            List<ScoreClassCEntity> classCEntityList = listClassC(classBId).getClassCEntityList();
            modelMap.addAttribute("scoreClassCList", classCEntityList);
        }
        Integer classCId = scoreRecordEntity.getScoreClassCId();
        if (null != classCId) {
            List<ScoreClassDEntity> classDEntityList = listClassD(classCId).getClassDEntityList();
            modelMap.addAttribute("scoreClassDList", classDEntityList);
        }

        return "scoreRecordUpdate";
    }

    // 评分更新处理
    @RequestMapping(value = "/scoreRecord/updatePost", method = RequestMethod.POST)
    public String updateScoreRecordPost(@ModelAttribute("scoreRecord") ScoreRecordEntity scoreRecordEntity) {
        Integer classAId = scoreRecordEntity.getScoreClassAId();
        if (null != classAId) {
            ScoreClassAEntity classAEntity = scoreClassARepository.findOne(classAId);
            scoreRecordEntity.setScoreClassAName(classAEntity.getScoreClassAName());
        }
        Integer classBId = scoreRecordEntity.getScoreClassBId();
        if (null != classBId) {
            ScoreClassBEntity classBEntity = scoreClassBRepository.findOne(classBId);
            scoreRecordEntity.setScoreClassBName(classBEntity.getScoreClassBName());

        }
        Integer classCId = scoreRecordEntity.getScoreClassCId();
        if (null != classCId) {
            ScoreClassCEntity classCEntity = scoreClassCRepository.findOne(classCId);
            scoreRecordEntity.setScoreClassCName(classCEntity.getScoreClassCName());
        }

//        scoreRecordRepository.updateScoreRecord(
//                scoreRecordEntity.getPatientId(),
//                scoreRecordEntity.getScoreClassAId(),
//                scoreRecordEntity.getScoreClassAName(),
//                scoreRecordEntity.getScoreClassBId(),
//                scoreRecordEntity.getScoreClassBName(),
//                scoreRecordEntity.getScoreClassCId(),
//                scoreRecordEntity.getScoreClassCName(),
//                scoreRecordEntity.getPatientId()
//        );
//        scoreRecordRepository.flush();
        return "redirect:/patient/detail/" + scoreRecordEntity.getPatientId();
    }


    // 删除影像检查记录
    @RequestMapping(value = "/scoreRecord/delete/{scoreRecordId}", method = RequestMethod.GET)
    public String deleteScoreRecord(@PathVariable("scoreRecordId") Integer scoreRecordId) {
        ScoreRecordEntity scoreRecordEntity = scoreRecordRepository.findOne(scoreRecordId);
        scoreRecordRepository.delete(scoreRecordId);
        scoreRecordRepository.flush();
        return "redirect:/patient/detail/" + scoreRecordEntity.getPatientId();

    }

    @RequestMapping(value = "/score/classB/{scoreClassAId}", method = RequestMethod.GET)
    @ResponseBody
    public ScoreClassBListResponse listClassB(@PathVariable("scoreClassAId") Integer scoreClassAId) {
        List<ScoreClassBEntity> classBEntityList = scoreClassBRepository.searchClassB(scoreClassAId);
        ScoreClassBListResponse listResponse = new ScoreClassBListResponse();
        listResponse.setClassBEntityList(classBEntityList);
        return listResponse;
    }

    @RequestMapping(value = "/score/classC/{scoreClassBId}", method = RequestMethod.GET)
    @ResponseBody
    public ScoreClassCListResponse listClassC(@PathVariable("scoreClassBId") Integer scoreClassBId) {
        List<ScoreClassCEntity> classCEntityList = scoreClassCRepository.searchClassC(scoreClassBId);
        ScoreClassCListResponse listResponse = new ScoreClassCListResponse();
        listResponse.setClassCEntityList(classCEntityList);
        return listResponse;
    }

    @RequestMapping(value = "/score/classD/{scoreClassCId}", method = RequestMethod.GET)
    @ResponseBody
    public ScoreClassDListResponse listClassD(@PathVariable("scoreClassCId") Integer scoreClassCId) {
        List<ScoreClassDEntity> classDEntityList = scoreClassDRepository.searchClassD(scoreClassCId);
        ScoreClassDListResponse listResponse = new ScoreClassDListResponse();
        listResponse.setClassDEntityList(classDEntityList);
        return listResponse;
    }


}