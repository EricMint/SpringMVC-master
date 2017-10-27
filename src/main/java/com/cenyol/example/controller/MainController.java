package com.cenyol.example.controller;

import com.cenyol.example.model.*;
import com.cenyol.example.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class MainController {

    // 自动装配
    @Autowired
    private PatientRepository patientRepository;

//    @Autowired
//    private PatientImagingExaminationRecordRepository patientImagingExaminationRecordRepository;
//
//    @Autowired
//    private PatientPhysicalExaminationRecordRepository patientPhysicalExaminationRecordRepository;
//
//    @Autowired
//    private ImagingExaminationCategoryRepository imagingExaminationCategoryRepository;
//
//    @Autowired
//    private ImagingExaminationItemRepository imagingExaminationItemRepository;
//
//    @Autowired
//    private ImagingExaminationItemOptionRepository imagingExaminationItemOptionRepository;

    // 首页
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    // 病人列表页
    @RequestMapping(value = "/patient/list", method = RequestMethod.GET)
    public String showPatientList(ModelMap modelMap) {
        List<PatientEntity> patientEntityList = patientRepository.findAll();
        modelMap.addAttribute("patientList", patientEntityList);
        return "patientList";
    }

    // 添加病人表单页面
    @RequestMapping(value = "/patient/add", method = RequestMethod.GET)
    public String addPatient() {
        return "patientAdd";
    }

    // 添加病人表单处理
    @RequestMapping(value = "/patient/addPost", method = RequestMethod.POST)
    public String addPatientPost(@ModelAttribute("user") PatientEntity patientEntity) {
        // 向数据库添加一个用户
        //userRepository.save(patientEntity);

        // 向数据库添加一个用户，并将内存中缓存区的数据刷新，立即写入数据库，之后才可以进行访问读取
        patientRepository.saveAndFlush(patientEntity);

        // 返回重定向页面
        Integer patientId = patientEntity.getId();
//        return "redirect:/patient/detail/" + patientId;
        return "redirect:/patient/list/";
    }

    // 查看病人详细信息
    @RequestMapping(value = "/patient/detail/{patientId}", method = RequestMethod.GET)
    public String showPatientDetail(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        if (null != patientEntity && null != (Integer) patientEntity.getPatientNumber()) {
            Integer patientNumber = patientEntity.getPatientNumber();
//            List<PatientImagingExaminationRecordEntity> recordEntityList = patientImagingExaminationRecordRepository.searchPatientImagingExaminationRecord(patientNumber);
//            modelMap.addAttribute("recordEntityList", recordEntityList);
//            List<PatientPhysicalExaminationRecordEntity> physicalRecordList = patientPhysicalExaminationRecordRepository.searchPatientPhysicalExaminationRecord(patientNumber);
//            modelMap.addAttribute("physicalRecordList", physicalRecordList);
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
        return "redirect:/patient/list";
    }

    // 删除病人
    @RequestMapping(value = "/patient/delete/{patientId}", method = RequestMethod.GET)
    public String deletePatient(@PathVariable("patientId") Integer patientId) {
        patientRepository.delete(patientId);
        patientRepository.flush();
        return "redirect:/patient/list";
    }
}