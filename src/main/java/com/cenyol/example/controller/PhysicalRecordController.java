package com.cenyol.example.controller;

import com.cenyol.example.model.*;
import com.cenyol.example.repository.*;
import com.cenyol.example.response.PhysicalClassBListResponse;
import com.cenyol.example.response.PhysicalClassCListResponse;
import com.cenyol.example.response.PhysicalClassDListResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class PhysicalRecordController {

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private PhysicalRecordRepository physicalRecordRepository;

    @Autowired
    private PhysicalClassARepository physicalClassARepository;

    @Autowired
    private PhysicalClassBRepository physicalClassBRepository;

    @Autowired
    private PhysicalClassCRepository physicalClassCRepository;

    @Autowired
    private PhysicalClassDRepository physicalClassDRepository;


    // 影像检查部位页面
    @RequestMapping(value = "/physicalRecord/create/{patientId}", method = RequestMethod.GET)
    public String addPhysicalRecord(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);

        List<PhysicalClassAEntity> physicalClassAEntityList = physicalClassARepository.findAll();
        modelMap.addAttribute("physicalClassAList", physicalClassAEntityList);

        return "physicalRecordCreate";
    }

    // 影像检查部位处理
    @RequestMapping(value = "/physicalRecord/createPost", method = RequestMethod.POST)
    public String addPhysicalRecordPost(@ModelAttribute("physicalRecord") PhysicalRecordEntity physicalRecordEntity) {
        Integer patientId = physicalRecordEntity.getPatientId();
        Integer classAId = physicalRecordEntity.getPhysicalClassAId();
        if (null != classAId) {
            PhysicalClassAEntity classAEntity = physicalClassARepository.findOne(classAId);
            physicalRecordEntity.setPhysicalClassAName(classAEntity.getPhysicalClassAName());
        }
        Integer classBId = physicalRecordEntity.getPhysicalClassBId();
        if (null != classBId) {
            PhysicalClassBEntity classBEntity = physicalClassBRepository.findOne(classBId);
            physicalRecordEntity.setPhysicalClassBName(classBEntity.getPhysicalClassBName());

        }
        Integer classCId = physicalRecordEntity.getPhysicalClassCId();
        if (null != classCId) {
            PhysicalClassCEntity classCEntity = physicalClassCRepository.findOne(classCId);
            physicalRecordEntity.setPhysicalClassCName(classCEntity.getPhysicalClassCName());
        }
        Integer classDId = physicalRecordEntity.getPhysicalClassDId();
        if (null != classDId) {
            PhysicalClassDEntity classDEntity = physicalClassDRepository.findOne(classDId);
            physicalRecordEntity.setPhysicalClassDName(classDEntity.getPhysicalClassDName());
        }
        PhysicalRecordEntity savedEntity = physicalRecordRepository.save(physicalRecordEntity);
        physicalRecordRepository.flush();
        Integer physicalRecordId = savedEntity.getPhysicalRecordId();
        return "redirect:/patient/detail/" + patientId;
    }

    // 影像检查部位更新页面
    @RequestMapping(value = "/physicalRecord/update/{physicalRecordId}", method = RequestMethod.GET)
    public String updatePhysicalRecord(@PathVariable("physicalRecordId") Integer physicalRecordId, ModelMap modelMap) {
        PhysicalRecordEntity physicalRecordEntity = physicalRecordRepository.findOne(physicalRecordId);
        modelMap.addAttribute("physicalRecord", physicalRecordEntity);
        Integer patientId = physicalRecordEntity.getPatientId();
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        List<PhysicalClassAEntity> physicalClassAEntityList = physicalClassARepository.findAll();
        modelMap.addAttribute("physicalClassAList", physicalClassAEntityList);

        Integer classAId = physicalRecordEntity.getPhysicalClassAId();
        if (null != classAId) {
            List<PhysicalClassBEntity> classBEntityList = listClassB(classAId).getClassBEntityList();
            modelMap.addAttribute("physicalClassBList", classBEntityList);
        }
        Integer classBId = physicalRecordEntity.getPhysicalClassBId();
        if (null != classBId) {
            List<PhysicalClassCEntity> classCEntityList = listClassC(classBId).getClassCEntityList();
            modelMap.addAttribute("physicalClassCList", classCEntityList);
        }
        Integer classCId = physicalRecordEntity.getPhysicalClassCId();
        if (null != classCId) {
            List<PhysicalClassDEntity> classDEntityList = listClassD(classCId).getClassDEntityList();
            modelMap.addAttribute("physicalClassDList", classDEntityList);
        }

        return "physicalRecordUpdate";
    }

    // 影像检查部位更新处理
    @RequestMapping(value = "/physicalRecord/updatePost", method = RequestMethod.POST)
    public String updatePhysicalRecordPost(@ModelAttribute("physicalRecord") PhysicalRecordEntity physicalRecordEntity) {
        Integer classAId = physicalRecordEntity.getPhysicalClassAId();
        if (null != classAId) {
            PhysicalClassAEntity classAEntity = physicalClassARepository.findOne(classAId);
            physicalRecordEntity.setPhysicalClassAName(classAEntity.getPhysicalClassAName());
        }
        Integer classBId = physicalRecordEntity.getPhysicalClassBId();
        if (null != classBId) {
            PhysicalClassBEntity classBEntity = physicalClassBRepository.findOne(classBId);
            physicalRecordEntity.setPhysicalClassBName(classBEntity.getPhysicalClassBName());

        }
        Integer classCId = physicalRecordEntity.getPhysicalClassCId();
        if (null != classCId) {
            PhysicalClassCEntity classCEntity = physicalClassCRepository.findOne(classCId);
            physicalRecordEntity.setPhysicalClassCName(classCEntity.getPhysicalClassCName());
        }
        Integer classDId = physicalRecordEntity.getPhysicalClassDId();
        if (null != classDId) {
            PhysicalClassDEntity classDEntity = physicalClassDRepository.findOne(classDId);
            physicalRecordEntity.setPhysicalClassDName(classDEntity.getPhysicalClassDName());
        }

        physicalRecordRepository.updatePhysicalRecord(
                physicalRecordEntity.getPhysicalClassAId(),
                physicalRecordEntity.getPhysicalClassAName(),
                physicalRecordEntity.getPhysicalClassBId(),
                physicalRecordEntity.getPhysicalClassBName(),
                physicalRecordEntity.getPhysicalClassCId(),
                physicalRecordEntity.getPhysicalClassCName(),
                physicalRecordEntity.getPhysicalClassDId(),
                physicalRecordEntity.getPhysicalClassDName(),
                physicalRecordEntity.getResult(),
                physicalRecordEntity.getPatientId()
        );
        physicalRecordRepository.flush();
        return "redirect:/patient/detail/" + physicalRecordEntity.getPatientId();
    }

    // 删除影像检查记录
    @RequestMapping(value = "/physicalRecord/delete/{physicalRecordId}", method = RequestMethod.GET)
    public String deletePhysicalRecord(@PathVariable("physicalRecordId") Integer physicalRecordId) {
        PhysicalRecordEntity physicalRecordEntity = physicalRecordRepository.findOne(physicalRecordId);
        physicalRecordRepository.delete(physicalRecordId);
        physicalRecordRepository.flush();
        return "redirect:/patient/detail/" + physicalRecordEntity.getPatientId();

    }

    @RequestMapping(value = "/physical/classB/{physicalClassAId}", method = RequestMethod.GET)
    @ResponseBody
    public PhysicalClassBListResponse listClassB(@PathVariable("physicalClassAId") Integer physicalClassAId) {
        List<PhysicalClassBEntity> classBEntityList = physicalClassBRepository.searchClassB(physicalClassAId);
        PhysicalClassBListResponse listResponse = new PhysicalClassBListResponse();
        listResponse.setClassBEntityList(classBEntityList);
        return listResponse;
    }

    @RequestMapping(value = "/physical/classC/{physicalClassBId}", method = RequestMethod.GET)
    @ResponseBody
    public PhysicalClassCListResponse listClassC(@PathVariable("physicalClassBId") Integer physicalClassBId) {
        List<PhysicalClassCEntity> classCEntityList = physicalClassCRepository.searchClassC(physicalClassBId);
        PhysicalClassCListResponse listResponse = new PhysicalClassCListResponse();
        listResponse.setClassCEntityList(classCEntityList);
        return listResponse;
    }

    @RequestMapping(value = "/physical/classD/{physicalClassCId}", method = RequestMethod.GET)
    @ResponseBody
    public PhysicalClassDListResponse listClassD(@PathVariable("physicalClassCId") Integer physicalClassCId) {
        List<PhysicalClassDEntity> classDEntityList = physicalClassDRepository.searchClassD(physicalClassCId);
        PhysicalClassDListResponse listResponse = new PhysicalClassDListResponse();
        listResponse.setClassDEntityList(classDEntityList);
        return listResponse;
    }


}