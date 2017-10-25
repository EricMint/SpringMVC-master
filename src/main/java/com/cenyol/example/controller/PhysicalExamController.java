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

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Controller
public class PhysicalExamController {

    // 自动装配
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PatientPhysicalExaminationRecordRepository patientPhysicalExaminationRecordRepository;

    @Autowired
    private PhysicalExaminationCategoryRepository physicalExaminationCategoryRepository;

    @Autowired
    private PhysicalExaminationItemRepository physicalExaminationItemRepository;

    @Autowired
    private ImagingExaminationItemOptionRepository imagingExaminationItemOptionRepository;


    // 添加体格检查部位页面
    @RequestMapping(value = "/exam/addPhysicalRecord/{userId}", method = RequestMethod.GET)
    public String addImagingRecord(@PathVariable("userId") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);

        List<PhysicalExaminationCategoryEntity> categoryEntityList = physicalExaminationCategoryRepository.findAll();
        modelMap.addAttribute("categoryList", categoryEntityList);

        return "addPhysicalRecord";
    }

    // 添加体格检查部位处理
    @RequestMapping(value = "/exam/addPhysicalRecordPost", method = RequestMethod.POST)
    public String addImagingRecordPost(@ModelAttribute("user") PatientPhysicalExaminationRecordEntity physicalRecordEntity) {
        Integer categoryId = physicalRecordEntity.getPhysicalExaminationCategoryId();
        PhysicalExaminationCategoryEntity categoryEntity = physicalExaminationCategoryRepository.findOne(categoryId);
        physicalRecordEntity.setPhysicalExaminationCategoryName(categoryEntity.getPhysicalExaminationCategoryName());
        patientPhysicalExaminationRecordRepository.saveAndFlush(physicalRecordEntity);
        Integer userId = physicalRecordEntity.getUserId();
        return "redirect:/exam/addPhysicalItemRecord/" + userId + "/category/" + categoryId;
    }

    // 添体格检查具体事项页面
    @RequestMapping(value = "/exam/addPhysicalItemRecord/{userId}/category/{categoryId}", method = RequestMethod.GET)
    public String addPhysicalRecordItem(@PathVariable("userId") Integer userId, @PathVariable("categoryId") Integer categoryId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);

        List<PhysicalExaminationItemEntity> itemEntityList = physicalExaminationItemRepository.searchPatientPhysicalExaminationItem(categoryId);
        modelMap.addAttribute("itemList", itemEntityList);


        return "addPhysicalRecordItem";
    }

    // 添加体格检查具体事项处理
    @RequestMapping(value = "/exam/addPhysicalRecordItemPost", method = RequestMethod.POST)
    public String addPhysicalRecordItemPost(@ModelAttribute("user") PatientPhysicalExaminationRecordEntity physicalExaminationRecordEntity) {
        Integer itemId = physicalExaminationRecordEntity.getPhysicalExaminationItemId();
        PhysicalExaminationItemEntity itemEntity = physicalExaminationItemRepository.findOne(itemId);
        physicalExaminationRecordEntity.setPhysicalExaminationCategoryId(itemEntity.getPhysicalExaminationCategoryId());
        physicalExaminationRecordEntity.setPhysicalExaminationCategoryName(itemEntity.getPhysicalExaminationCategoryName());
        physicalExaminationRecordEntity.setPhysicalExaminationItemName(itemEntity.getPhysicalExaminationItemName());
        patientPhysicalExaminationRecordRepository.updateRecord(
                physicalExaminationRecordEntity.getPhysicalExaminationCategoryId(),
                physicalExaminationRecordEntity.getPhysicalExaminationCategoryName(),
                physicalExaminationRecordEntity.getPhysicalExaminationItemId(),
                physicalExaminationRecordEntity.getPhysicalExaminationItemName(),
                physicalExaminationRecordEntity.getPhysicalExaminationItemOptionId(),
                physicalExaminationRecordEntity.getPhysicalExaminationItemOptionName(),
                physicalExaminationRecordEntity.getPhysicalExaminationItemOptionSubId(),
                physicalExaminationRecordEntity.getPhysicalExaminationItemOptionSubName(),
                physicalExaminationRecordEntity.getUserId());
        Integer userId = physicalExaminationRecordEntity.getUserId();
        return "redirect:/showUser/" + userId;
//        return "redirect:/exam/addPhysicalRecord/" + userId + "/item/" + itemId;
    }

}