package com.bysy.hospital.controller;

import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private UserRepository userRepository;

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
        List<PatientEntity> patientEntityList = patientRepository.findAll();
        modelMap.addAttribute("patientList", patientEntityList);
        return "patientList";
    }

    // 病人列表页 notManager
    @RequestMapping(value = "/patient/list/notManager", method = RequestMethod.GET)
    public String showPatientListNotManager(ModelMap modelMap) {
        Boolean isManager = false;
        modelMap.addAttribute("isManager", isManager);
        List<PatientEntity> patientEntityList = patientRepository.findAll();
        modelMap.addAttribute("patientList", patientEntityList);
        return "patientList";
    }

    // 搜索病人
    @RequestMapping(value = "/patient/search", method = RequestMethod.POST)
    public String searchPatients(@RequestParam Integer patientNumber, @RequestParam String realName, @RequestParam String disease,
                                 @RequestParam String ethnicity, @RequestParam String gender,
                                 @RequestParam Integer minAge, @RequestParam Integer maxAge,
                                 @RequestParam Integer minHeight, @RequestParam Integer maxHeight,
                                 @RequestParam Integer minWeight, @RequestParam Integer maxWeight, ModelMap model) {
        List<PatientEntity> patientEntityList = patientRepository.searchPatient(patientNumber, realName, disease, ethnicity, gender, minAge, maxAge, minHeight, maxHeight, minWeight, maxWeight);
        model.put("patientList", patientEntityList);
        model.addAttribute("isManager", true);
        return "patientList";
//        return "patientListSearchData";
//        return "redirect:/patient/detail/isManager/";
    }


    // 添加病人表单页面
    @RequestMapping(value = "/patient/add", method = RequestMethod.GET)
    public String addPatient() {
        return "patientAdd";
    }

    // 添加病人表单处理
    @RequestMapping(value = "/patient/addPost", method = RequestMethod.POST)
    public String addPatientPost(@ModelAttribute("user") PatientEntity patientEntity) {
        PatientEntity savedEntity = patientRepository.save(patientEntity);
        patientRepository.flush();

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
        PatientEntity patientEntity = patientRepository.findOne(patientId);
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
        PatientEntity patientEntity = patientRepository.findOne(patientId);
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
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        return "patientUpdate";
    }

    // 处理用户修改请求
    @RequestMapping(value = "/patient/updatePost", method = RequestMethod.POST)
    public String updatePatientPost(@ModelAttribute("patient") PatientEntity patientEntity) {
        patientRepository.updatePatient(
                patientEntity.getPatientNumber(),
                patientEntity.getRealName(),
                patientEntity.getDisease(),
                patientEntity.getEthnicity(),
                patientEntity.getGender(),
                patientEntity.getAge(),
                patientEntity.getHeight(),
                patientEntity.getWeight(),
                patientEntity.getId()
        );
        return "redirect:/patient/detail/isManager/" + patientEntity.getId();
    }

    // 删除病人
    @RequestMapping(value = "/patient/delete/{patientId}", method = RequestMethod.GET)
    public String deletePatient(@PathVariable("patientId") Integer patientId) {
        patientRepository.delete(patientId);
        patientRepository.flush();
        return "redirect:/patient/list";
    }
}