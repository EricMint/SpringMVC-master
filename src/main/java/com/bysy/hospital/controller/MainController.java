package com.bysy.hospital.controller;

import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.*;
import com.bysy.hospital.request.PatientSearchRequest;
import com.bysy.hospital.request.PatientUpdateRequest;
import com.bysy.hospital.request.PhysicalJizhuCetujixingRequest;
import com.bysy.hospital.request.PhysicalJizhuHuodongduRequest;
import com.bysy.hospital.response.PatientListResponse;
import com.bysy.hospital.service.PatientService;
import com.bysy.hospital.service.PhysicalService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private PhysicalService physicalService;

    @Autowired
    private PatientRepositoryDeprecated patientRepositoryDeprecated;

    @Autowired
    private ImageRecordRepository imageRecordRepository;

    @Autowired
    private PhysicalRecordRepository physicalRecordRepository;

    @Autowired
    private ScoreMarkRepository scoreMarkRepository;

    @Autowired
    private PhysicalClassARepository physicalClassARepository;

    @Autowired
    private ImageClassARepository imageClassARepository;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private PatientService patientService;


    // 首页
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    // 病人列表页 isManager
    @RequestMapping(value = "/patient/list/isManager", method = RequestMethod.GET)
    public String showPatientList(ModelMap modelMap) {
        Boolean isManager = true;
        modelMap.addAttribute("isManager", isManager);
        PatientSearchRequest searchRequest = new PatientSearchRequest();
        searchRequest.setPageSize(10000);
        PatientListResponse listResponse = patientService.searchPatientList(searchRequest);
        List<PatientEntity> patientEntityList = listResponse.getPatientEntityList();
        modelMap.addAttribute("patientList", patientEntityList);
        return "patientList";
    }

    // 病人列表页 notManager
    @RequestMapping(value = "/patient/list/notManager", method = RequestMethod.GET)
    public String showPatientListNotManager(ModelMap modelMap) {
        Boolean isManager = false;
        modelMap.addAttribute("isManager", isManager);
        List<PatientEntity> patientEntityList = patientRepositoryDeprecated.findAll();
        modelMap.addAttribute("patientList", patientEntityList);
        return "patientList";
    }

    @ResponseBody
    @RequestMapping(value = "/patient/search", method = RequestMethod.POST, produces = "application/json")
    public PatientListResponse searchPatientList(@RequestBody PatientSearchRequest searchRequest) {
        searchRequest.setPageSize(10000);
        PatientListResponse patientListResponse = patientService.searchPatientList(searchRequest);
        return patientListResponse;
    }

    @ResponseBody
    @RequestMapping(value = "/patient/physical/jizhu/cetujixing/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public PhysicalJizhuCetujixingEntity physicalJizhuCetujixingGet(@PathVariable("patientId") Integer patientId) {
        PhysicalJizhuCetujixingEntity physicalJizhuCetujixingEntity = physicalService.findJizhuCetujixing(patientId);
        return physicalJizhuCetujixingEntity;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/jizhu/cetujixing", method = RequestMethod.POST)
    @ResponseBody
    public void physicalJizhuCetujixingUpdate(@RequestBody PhysicalJizhuCetujixingRequest request) {
        physicalService.updateOrCreateJizhuCetujixing(request);
    }

    @ResponseBody
    @RequestMapping(value = "/patient/physical/jizhu/huodongdu/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public List<PhysicalJizhuHuodongduEntity> physicalJizhuHuodongduGet(@PathVariable("patientId") Integer patientId) {
        List<PhysicalJizhuHuodongduEntity> entityList= physicalService.findJizhuHuodongdu(patientId);
        return entityList;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/jizhu/huodongdu", method = RequestMethod.POST)
    @ResponseBody
    public void physicalJizhuHuodongduUpdate(@RequestBody PhysicalJizhuHuodongduRequest request) {
        physicalService.updateOrCreateJizhuHuodongdu(request);
    }

    // 添加病人表单页面
    @RequestMapping(value = "/patient/add", method = RequestMethod.GET)
    public String addPatient() {
        return "patientAdd";
    }

    // 添加病人表单处理
    @RequestMapping(value = "/patient/addPost", method = RequestMethod.POST)
    public String addPatientPost(@ModelAttribute("user") PatientEntity patientEntity) {
        PatientEntity savedEntity = patientRepositoryDeprecated.save(patientEntity);
        patientRepositoryDeprecated.flush();

        return "redirect:/patient/detail/isManager/" + savedEntity.getId();
//        return "redirect:/patient/list/";
    }

    // 查看病人详细信息 manager
    @RequestMapping(value = "/patient/detail/isManager/{patientId}", method = RequestMethod.GET)
    public String showPatientDetail(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
//        List<UserEntity> userEntityList = userRepository.searchUserByUserName(userName);
//        UserEntity userEntity = userEntityList.get(0);
//        modelMap.addAttribute("userEntity", userEntity);
//        Boolean isManager = userEntity.getRole().equals("manager");
        Boolean isManager = true;
        modelMap.addAttribute("isManager", isManager);
        PatientEntity patientEntity = patientRepositoryDeprecated.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        List<PhysicalClassAEntity> physicalClassAEntityList = physicalClassARepository.findAll();
        modelMap.addAttribute("physicalClassAList", physicalClassAEntityList);
        List<ImageClassAEntity> imageClassAEntityList = imageClassARepository.findAll();
        modelMap.addAttribute("imageClassAList", imageClassAEntityList);

        if (null != patientEntity) {
            List<PhysicalRecordEntity> physicalRecordEntityList = physicalRecordRepository.searchPhysicalRecord(patientId);
            modelMap.addAttribute("physicalRecordList", physicalRecordEntityList);
            List<ScoreMarkEntity> scoreMarkEntityList = scoreMarkRepository.searchScoreMarkByPatientId(patientId);
            modelMap.addAttribute("scoreMarkList", scoreMarkEntityList);
            List<ImageRecordEntity> imageRecordEntityList = imageRecordRepository.searchImageRecord(patientId);
            modelMap.addAttribute("imageRecordList", imageRecordEntityList);
        }

        return "patientDetail";
    }

    // 查看病人详细信息 not manager
    @RequestMapping(value = "/patient/detail/notManager/{patientId}", method = RequestMethod.GET)
    public String showPatientDetailNotManager(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
        Boolean isManager = false;
        modelMap.addAttribute("isManager", isManager);
        PatientEntity patientEntity = patientRepositoryDeprecated.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        if (null != patientEntity) {
            List<PhysicalRecordEntity> physicalRecordEntityList = physicalRecordRepository.searchPhysicalRecord(patientId);
            modelMap.addAttribute("physicalRecordList", physicalRecordEntityList);
            List<ImageRecordEntity> imageRecordEntityList = imageRecordRepository.searchImageRecord(patientId);
            modelMap.addAttribute("imageRecordList", imageRecordEntityList);
            List<ScoreMarkEntity> scoreMarkEntityList = scoreMarkRepository.searchScoreMarkByPatientId(patientId);
            modelMap.addAttribute("scoreMarkList", scoreMarkEntityList);
        }

        return "patientDetail";
    }

    // 更新用户信息页面
    @RequestMapping(value = "/patient/update/{patientId}", method = RequestMethod.GET)
    public String updatePatient(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepositoryDeprecated.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        return "patientUpdate";
    }

    @Transactional
    @RequestMapping(value = "/patient/updatePost", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updatePatientPost(@RequestBody PatientUpdateRequest updateRequest) {
        PatientEntity patientEntity = patientRepository.findOneById(PatientEntity.class, updateRequest.getPatientId());
        BeanUtils.copyProperties(updateRequest, patientEntity);
        patientRepository.update(patientEntity);
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("patient", patientEntity);
        return model;
    }

    // 删除病人
    @RequestMapping(value = "/patient/delete/{patientId}", method = RequestMethod.GET)
    public String deletePatient(@PathVariable("patientId") Integer patientId) {
        patientRepositoryDeprecated.delete(patientId);
        patientRepositoryDeprecated.flush();
        return "redirect:/patient/list";
    }
}