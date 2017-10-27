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
public class ImageRecordController {

    // 自动装配
    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private PatientImagingExaminationRecordRepository patientImagingExaminationRecordRepository;

    @Autowired
    private PatientPhysicalExaminationRecordRepository patientPhysicalExaminationRecordRepository;

    @Autowired
    private ImagingExaminationCategoryRepository imagingExaminationCategoryRepository;

    @Autowired
    private ImagingExaminationItemRepository imagingExaminationItemRepository;

    @Autowired
    private ImagingExaminationItemOptionRepository imagingExaminationItemOptionRepository;


    // 添加影像检查部位页面
    @RequestMapping(value = "/addImagingRecord/{id}", method = RequestMethod.GET)
    public String addImagingRecord(@PathVariable("id") Integer userId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(userId);
        modelMap.addAttribute("user", patientEntity);

        List<ImagingExaminationCategoryEntity> categoryEntityList = imagingExaminationCategoryRepository.findAll();
        modelMap.addAttribute("categoryList", categoryEntityList);

        return "addImagingRecord";
    }

    // 添加影像检查部位处理
    @RequestMapping(value = "/addImagingRecordPost", method = RequestMethod.POST)
    public String addImagingRecordPost(@ModelAttribute("user") PatientImagingExaminationRecordEntity imagingExaminationRecordEntity) {
        Integer categoryId = imagingExaminationRecordEntity.getImagingExaminationCategoryId();
        ImagingExaminationCategoryEntity categoryEntity = imagingExaminationCategoryRepository.findOne(categoryId);
        imagingExaminationRecordEntity.setImagingExaminationCategoryName(categoryEntity.getImagingExaminationCategoryName());
        patientImagingExaminationRecordRepository.saveAndFlush(imagingExaminationRecordEntity);
        Integer userId = imagingExaminationRecordEntity.getUserId();
        return "redirect:/addImagingRecord/" + userId + "/category/" + categoryId;
    }

    // 添影像检查具体事项页面
    @RequestMapping(value = "/addImagingRecord/{userId}/category/{categoryId}", method = RequestMethod.GET)
    public String addImagingRecordItem(@PathVariable("userId") Integer userId, @PathVariable("categoryId") Integer categoryId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(userId);
        modelMap.addAttribute("user", patientEntity);

        List<ImagingExaminationItemEntity> itemEntityList = imagingExaminationItemRepository.searchPatientImagingExaminationItem(categoryId);
        modelMap.addAttribute("itemList", itemEntityList);


        return "addImagingRecordItem";
    }

    // 添加影像检查具体事项处理
    @RequestMapping(value = "/addImagingRecordItemPost", method = RequestMethod.POST)
    public String addImagingRecordItemPost(@ModelAttribute("user") PatientImagingExaminationRecordEntity imagingExaminationRecordEntity) {
        Integer itemId = imagingExaminationRecordEntity.getImagingExaminationItemId();
        ImagingExaminationItemEntity itemEntity = imagingExaminationItemRepository.findOne(itemId);
        imagingExaminationRecordEntity.setImagingExaminationCategoryId(itemEntity.getImagingExaminationCategoryId());
        imagingExaminationRecordEntity.setImagingExaminationCategoryName(itemEntity.getImagingExaminationCategoryName());
        imagingExaminationRecordEntity.setImagingExaminationItemName(itemEntity.getImagingExaminationItemName());
        patientImagingExaminationRecordRepository.updateRecord(
                imagingExaminationRecordEntity.getImagingExaminationCategoryId(),
                imagingExaminationRecordEntity.getImagingExaminationCategoryName(),
                imagingExaminationRecordEntity.getImagingExaminationItemId(),
                imagingExaminationRecordEntity.getImagingExaminationItemName(),
                imagingExaminationRecordEntity.getImagingExaminationItemOptionId(),
                imagingExaminationRecordEntity.getImagingExaminationItemOptionName(),
                imagingExaminationRecordEntity.getUserId());
        Integer userId = imagingExaminationRecordEntity.getUserId();
        return "redirect:/addImagingRecord/" + userId + "/item/" + itemId;
    }

    // 添影像检查具体事项选项页面
    @RequestMapping(value = "/addImagingRecord/{userId}/item/{itemId}", method = RequestMethod.GET)
    public String addImagingRecordItemOption(@PathVariable("userId") Integer userId, @PathVariable("itemId") Integer itemId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(userId);
        modelMap.addAttribute("user", patientEntity);

        List<ImagingExaminationItemOptionEntity> optionEntityList = imagingExaminationItemOptionRepository.searchPatientImagingExaminationItemOption(itemId);
        modelMap.addAttribute("optionList", optionEntityList);


        return "addImagingRecordItemOption";
    }

    // 添加影像检查具体事项选项处理
    @RequestMapping(value = "/addImagingRecordItemOptionPost", method = RequestMethod.POST)
    public String addImagingRecordItemOptionPost(@ModelAttribute("user") PatientImagingExaminationRecordEntity imagingExaminationRecordEntity) {
        Integer optionId = imagingExaminationRecordEntity.getImagingExaminationItemOptionId();
        ImagingExaminationItemOptionEntity optionEntity = imagingExaminationItemOptionRepository.findOne(optionId);
        Integer itemId = optionEntity.getImagingExaminationItemId();
        ImagingExaminationItemEntity itemEntity = imagingExaminationItemRepository.findOne(itemId);

        imagingExaminationRecordEntity.setImagingExaminationCategoryId(itemEntity.getImagingExaminationCategoryId());
        imagingExaminationRecordEntity.setImagingExaminationCategoryName(itemEntity.getImagingExaminationCategoryName());
        imagingExaminationRecordEntity.setImagingExaminationItemName(itemEntity.getImagingExaminationItemName());
        imagingExaminationRecordEntity.setImagingExaminationItemId(itemEntity.getId());
        imagingExaminationRecordEntity.setImagingExaminationItemOptionId(optionId);
        imagingExaminationRecordEntity.setImagingExaminationItemOptionName(optionEntity.getImagingExaminationItemOptionName());
        patientImagingExaminationRecordRepository.updateRecord(
                imagingExaminationRecordEntity.getImagingExaminationCategoryId(),
                imagingExaminationRecordEntity.getImagingExaminationCategoryName(),
                imagingExaminationRecordEntity.getImagingExaminationItemId(),
                imagingExaminationRecordEntity.getImagingExaminationItemName(),
                imagingExaminationRecordEntity.getImagingExaminationItemOptionId(),
                imagingExaminationRecordEntity.getImagingExaminationItemOptionName(),
                imagingExaminationRecordEntity.getUserId());
        Integer userId = imagingExaminationRecordEntity.getUserId();
        return "redirect:/showPatientDetail/" + userId;
    }


}