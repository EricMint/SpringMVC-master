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

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private ImageRecordRepository imageRecordRepository;

    @Autowired
    private PatientImagingExaminationRecordRepository patientImagingExaminationRecordRepository;

    @Autowired
    private PatientPhysicalExaminationRecordRepository patientPhysicalExaminationRecordRepository;

    @Autowired
    private ImagingExaminationCategoryRepository imagingExaminationCategoryRepository;

    @Autowired
    private ImageClassARepository imageClassARepository;

    @Autowired
    private ImagingExaminationItemRepository imagingExaminationItemRepository;

    @Autowired
    private ImagingExaminationItemOptionRepository imagingExaminationItemOptionRepository;


    // 添加影像检查部位页面
    @RequestMapping(value = "/imageRecord/create/{patientId}", method = RequestMethod.GET)
    public String addImagingRecord(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);

        List<ImageClassAEntity> imageClassAEntityList = imageClassARepository.findAll();
        modelMap.addAttribute("imageClassAList", imageClassAEntityList);

        return "imageRecordCreate";
    }

    // 添加影像检查部位处理
    @RequestMapping(value = "/imageRecord/createPost", method = RequestMethod.POST)
    public String addImagingRecordPost(@ModelAttribute("user") ImageRecordEntity imageRecordEntity) {
        ImageClassAEntity classAEntity = imageClassARepository.findOne(imageRecordEntity.getImageClassAId());
        imageRecordEntity.setImageClassAName(classAEntity.getImageClassAName());
        ImageRecordEntity savedEntity = imageRecordRepository.save(imageRecordEntity);
        imageRecordRepository.flush();
        Integer imageRecordId = savedEntity.getImageRecordId();
        return "redirect:/addImagingRecord/" + imageRecordId;
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