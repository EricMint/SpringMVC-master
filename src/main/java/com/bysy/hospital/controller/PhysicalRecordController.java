package com.bysy.hospital.controller;

import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.*;
import com.bysy.hospital.request.PhysicalJizhuCetujixingRequest;
import com.bysy.hospital.request.PhysicalJizhuHuodongduRequest;
import com.bysy.hospital.request.PhysicalJizhuShiyanRequest;
import com.bysy.hospital.response.PhysicalClassB;
import com.bysy.hospital.response.PhysicalClassDListResponse;
import com.bysy.hospital.response.PhysicalClassBListResponse;
import com.bysy.hospital.response.PhysicalClassCListResponse;
import com.bysy.hospital.service.PhysicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@Controller
public class PhysicalRecordController {

    @Autowired
    private PhysicalService physicalService;

    @Autowired
    private PatientRepositoryDeprecated patientRepositoryDeprecated;

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

    @ResponseBody
    @RequestMapping(value = "/patient/physical/jizhu/shiyan/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public List<PhysicalJizhuShiyanEntity> physicalJizhuShiyanGet(@PathVariable("patientId") Integer patientId) {
        List<PhysicalJizhuShiyanEntity> entityList= physicalService.findJizhuShiyan(patientId);
        return entityList;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/jizhu/shiyan", method = RequestMethod.POST)
    @ResponseBody
    public void physicalJizhushiyanUpdate(@RequestBody PhysicalJizhuShiyanRequest request) {
        physicalService.updateOrCreateJizhuShiyan(request);
    }

    // 影像检查部位页面
    @RequestMapping(value = "/physicalRecord/create/{patientId}/{physicalClassAId}", method = RequestMethod.GET)
    public String addPhysicalRecord(@PathVariable("patientId") Integer patientId, @PathVariable("physicalClassAId") Integer physicalClassAId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepositoryDeprecated.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);

        List<PhysicalClassBEntity> physicalClassBEntityList = physicalClassBRepository.searchClassB(physicalClassAId);
        List<PhysicalClassB> physicalClassBList = new ArrayList<PhysicalClassB>();
        for (PhysicalClassBEntity entity : physicalClassBEntityList) {
            PhysicalClassB physicalClassB = new PhysicalClassB();
            physicalClassB.setPhysicalClassAId(entity.getPhysicalClassAId());
            physicalClassB.setPhysicalClassAName(entity.getPhysicalClassAName());
            physicalClassB.setPhysicalClassBId(entity.getPhysicalClassBId());
            physicalClassB.setPhysicalClassBName(entity.getPhysicalClassBName());
            PhysicalClassCListResponse classCListResponse = listClassC(physicalClassB.getPhysicalClassBId());
            physicalClassB.setPhysicalClassCEntityList(classCListResponse.getClassCEntityList());
            physicalClassBList.add(physicalClassB);
        }
        modelMap.addAttribute("physicalClassBList", physicalClassBList);

        return "physicalRecordCreate";
    }

    // 影像检查部位处理
    @RequestMapping(value = "/physicalRecord/createPost", method = RequestMethod.POST)
    public void addPhysicalRecordPost(@ModelAttribute("physicalRecord") PhysicalRecordEntity physicalRecordEntity) {
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
//        return "redirect:/patient/detail/isManager/" + patientId;
    }

    // 影像检查部位更新页面
    @RequestMapping(value = "/physicalRecord/update/{physicalRecordId}", method = RequestMethod.GET)
    public String updatePhysicalRecord(@PathVariable("physicalRecordId") Integer physicalRecordId, ModelMap modelMap) {
        PhysicalRecordEntity physicalRecordEntity = physicalRecordRepository.findOne(physicalRecordId);
        modelMap.addAttribute("physicalRecord", physicalRecordEntity);
        Integer patientId = physicalRecordEntity.getPatientId();
        PatientEntity patientEntity = patientRepositoryDeprecated.findOne(patientId);
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
                physicalRecordEntity.getPhysicalRecordId()
        );
        physicalRecordRepository.flush();
        return "redirect:/patient/detail/isManager/" + physicalRecordEntity.getPatientId();
    }

    // 删除影像检查记录
    @RequestMapping(value = "/physicalRecord/delete/{physicalRecordId}", method = RequestMethod.GET)
    public String deletePhysicalRecord(@PathVariable("physicalRecordId") Integer physicalRecordId) {
        PhysicalRecordEntity physicalRecordEntity = physicalRecordRepository.findOne(physicalRecordId);
        physicalRecordRepository.delete(physicalRecordId);
        physicalRecordRepository.flush();
        return "redirect:/patient/detail/isManager/" + physicalRecordEntity.getPatientId();

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