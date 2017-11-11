package com.bysy.hospital.controller;

import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.*;
import com.bysy.hospital.response.*;
import com.bysy.hospital.model.*;
import com.bysy.hospital.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@Controller
public class ImageRecordController {

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private ImageRecordRepository imageRecordRepository;

    @Autowired
    private ImageClassARepository imageClassARepository;

    @Autowired
    private ImageClassBRepository imageClassBRepository;

    @Autowired
    private ImageClassCRepository imageClassCRepository;

    @Autowired
    private ImageClassDRepository imageClassDRepository;

    @Autowired
    private ImageClassERepository imageClassERepository;


    // 影像检查部位页面
    @RequestMapping(value = "/imageRecord/create/{patientId}/{imageClassAId}", method = RequestMethod.GET)
    public String addImagingRecord(@PathVariable("patientId") Integer patientId, @PathVariable("imageClassAId") Integer imageClassAId, ModelMap modelMap) {
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);

        List<ImageClassBEntity> imageClassBEntityList = imageClassBRepository.searchClassB(imageClassAId);
        List<ImageClassB> imageClassBList = new ArrayList<ImageClassB>();
        for (ImageClassBEntity entity : imageClassBEntityList) {
            ImageClassB imageClassB = new ImageClassB();
            imageClassB.setImageClassAId(entity.getImageClassAId());
            imageClassB.setImageClassAName(entity.getImageClassAName());
            imageClassB.setImageClassBId(entity.getImageClassBId());
            imageClassB.setImageClassBName(entity.getImageClassBName());
            ImageClassCListResponse classCListResponse = listClassC(imageClassB.getImageClassBId());
            imageClassB.setImageClassCEntityList(classCListResponse.getClassCEntityList());
            imageClassBList.add(imageClassB);
        }
        modelMap.addAttribute("imageClassBList", imageClassBList);

//        List<ImageClassAEntity> imageClassAEntityList = imageClassARepository.findAll();
//        modelMap.addAttribute("imageClassAList", imageClassAEntityList);

        return "imageRecordCreate";
    }

    // 影像检查部位处理
    @RequestMapping(value = "/imageRecord/createPost", method = RequestMethod.POST)
    public String addImagingRecordPost(@ModelAttribute("imageRecord") ImageRecordEntity imageRecordEntity) {
        Integer patientId = imageRecordEntity.getPatientId();
        Integer classAId = imageRecordEntity.getImageClassAId();
        if (null != classAId) {
            ImageClassAEntity classAEntity = imageClassARepository.findOne(classAId);
            imageRecordEntity.setImageClassAName(classAEntity.getImageClassAName());
        }
        Integer classBId = imageRecordEntity.getImageClassBId();
        if (null != classBId) {
            ImageClassBEntity classBEntity = imageClassBRepository.findOne(classBId);
            imageRecordEntity.setImageClassBName(classBEntity.getImageClassBName());

        }
        Integer classCId = imageRecordEntity.getImageClassCId();
        if (null != classCId) {
            ImageClassCEntity classCEntity = imageClassCRepository.findOne(classCId);
            imageRecordEntity.setImageClassCName(classCEntity.getImageClassCName());
        }
        Integer classDId = imageRecordEntity.getImageClassDId();
        if (null != classDId) {
            ImageClassDEntity classDEntity = imageClassDRepository.findOne(classDId);
            imageRecordEntity.setImageClassDName(classDEntity.getImageClassDName());
        }
        Integer classEId = imageRecordEntity.getImageClassEId();
        if (null != classEId) {
            ImageClassEEntity classEEntity = imageClassERepository.findOne(classEId);
            imageRecordEntity.setImageClassEName(classEEntity.getImageClassEName());
        }
        ImageRecordEntity savedEntity = imageRecordRepository.save(imageRecordEntity);
        imageRecordRepository.flush();
        Integer imageRecordId = savedEntity.getImageRecordId();
        return "redirect:/patient/detail/isManager/" + patientId;
    }

    // 影像检查部位更新页面
    @RequestMapping(value = "/imageRecord/update/{imageRecordId}", method = RequestMethod.GET)
    public String updateImagingRecord(@PathVariable("imageRecordId") Integer imageRecordId, ModelMap modelMap) {
        ImageRecordEntity imageRecordEntity = imageRecordRepository.findOne(imageRecordId);
        modelMap.addAttribute("imageRecord", imageRecordEntity);
        Integer patientId = imageRecordEntity.getPatientId();
        PatientEntity patientEntity = patientRepository.findOne(patientId);
        modelMap.addAttribute("patient", patientEntity);
        List<ImageClassAEntity> imageClassAEntityList = imageClassARepository.findAll();
        modelMap.addAttribute("imageClassAList", imageClassAEntityList);

        Integer classAId = imageRecordEntity.getImageClassAId();
        if (null != classAId) {
            List<ImageClassBEntity> classBEntityList = listClassB(classAId).getClassBEntityList();
            modelMap.addAttribute("imageClassBList", classBEntityList);
        }
        Integer classBId = imageRecordEntity.getImageClassBId();
        if (null != classBId) {
            List<ImageClassCEntity> classCEntityList = listClassC(classBId).getClassCEntityList();
            modelMap.addAttribute("imageClassCList", classCEntityList);
        }
        Integer classCId = imageRecordEntity.getImageClassCId();
        if (null != classCId) {
            List<ImageClassDEntity> classDEntityList = listClassD(classCId).getClassDEntityList();
            modelMap.addAttribute("imageClassDList", classDEntityList);
        }
        Integer classDId = imageRecordEntity.getImageClassDId();
        if (null != classDId) {
            List<ImageClassEEntity> classEEntityList = listClassE(classDId).getClassEEntityList();
            modelMap.addAttribute("imageClassEList", classEEntityList);
        }

        return "imageRecordUpdate";
    }

    // 影像检查部位更新处理
    @RequestMapping(value = "/imageRecord/updatePost", method = RequestMethod.POST)
    public String updateImagingRecordPost(@ModelAttribute("imageRecord") ImageRecordEntity imageRecordEntity) {
        Integer classAId = imageRecordEntity.getImageClassAId();
        if (null != classAId) {
            ImageClassAEntity classAEntity = imageClassARepository.findOne(classAId);
            imageRecordEntity.setImageClassAName(classAEntity.getImageClassAName());
        }
        Integer classBId = imageRecordEntity.getImageClassBId();
        if (null != classBId) {
            ImageClassBEntity classBEntity = imageClassBRepository.findOne(classBId);
            imageRecordEntity.setImageClassBName(classBEntity.getImageClassBName());

        }
        Integer classCId = imageRecordEntity.getImageClassCId();
        if (null != classCId) {
            ImageClassCEntity classCEntity = imageClassCRepository.findOne(classCId);
            imageRecordEntity.setImageClassCName(classCEntity.getImageClassCName());
        }
        Integer classDId = imageRecordEntity.getImageClassDId();
        if (null != classDId) {
            ImageClassDEntity classDEntity = imageClassDRepository.findOne(classDId);
            imageRecordEntity.setImageClassDName(classDEntity.getImageClassDName());
        }
        Integer classEId = imageRecordEntity.getImageClassEId();
        if (null != classEId) {
            ImageClassEEntity classEEntity = imageClassERepository.findOne(classEId);
            imageRecordEntity.setImageClassEName(classEEntity.getImageClassEName());
        }
        imageRecordRepository.updateImageRecord(
                imageRecordEntity.getImageClassAId(),
                imageRecordEntity.getImageClassAName(),
                imageRecordEntity.getImageClassBId(),
                imageRecordEntity.getImageClassBName(),
                imageRecordEntity.getImageClassCId(),
                imageRecordEntity.getImageClassCName(),
                imageRecordEntity.getImageClassDId(),
                imageRecordEntity.getImageClassDName(),
                imageRecordEntity.getImageClassEId(),
                imageRecordEntity.getImageClassEName(),
                imageRecordEntity.getResult(),
                imageRecordEntity.getImageRecordId()
        );
        imageRecordRepository.flush();
        return "redirect:/patient/detail/isManager/" + imageRecordEntity.getPatientId();
    }

    // 删除影像检查记录
    @RequestMapping(value = "/imageRecord/delete/{imageRecordId}", method = RequestMethod.GET)
    public String deletePatient(@PathVariable("imageRecordId") Integer imageRecordId) {
        ImageRecordEntity imageRecordEntity = imageRecordRepository.findOne(imageRecordId);
        imageRecordRepository.delete(imageRecordId);
        imageRecordRepository.flush();
        return "redirect:/patient/detail/isManager/" + imageRecordEntity.getPatientId();

    }

    @RequestMapping(value = "/image/classB/{imageClassAId}", method = RequestMethod.GET)
    @ResponseBody
    public ImageClassBListResponse listClassB(@PathVariable("imageClassAId") Integer imageClassAId) {
        List<ImageClassBEntity> classBEntityList = imageClassBRepository.searchClassB(imageClassAId);
        ImageClassBListResponse listResponse = new ImageClassBListResponse();
        listResponse.setClassBEntityList(classBEntityList);
        return listResponse;
    }

    @RequestMapping(value = "/image/classC/{imageClassBId}", method = RequestMethod.GET)
    @ResponseBody
    public ImageClassCListResponse listClassC(@PathVariable("imageClassBId") Integer imageClassBId) {
        List<ImageClassCEntity> classCEntityList = imageClassCRepository.searchClassC(imageClassBId);
        ImageClassCListResponse listResponse = new ImageClassCListResponse();
        listResponse.setClassCEntityList(classCEntityList);
        return listResponse;
    }

    @RequestMapping(value = "/image/classD/{imageClassCId}", method = RequestMethod.GET)
    @ResponseBody
    public ImageClassDListResponse listClassD(@PathVariable("imageClassCId") Integer imageClassCId) {
        List<ImageClassDEntity> classDEntityList = imageClassDRepository.searchClassD(imageClassCId);
        ImageClassDListResponse listResponse = new ImageClassDListResponse();
        listResponse.setClassDEntityList(classDEntityList);
        return listResponse;
    }

    @RequestMapping(value = "/image/classE/{imageClassDId}", method = RequestMethod.GET)
    @ResponseBody
    public ImageClassEListResponse listClassE(@PathVariable("imageClassDId") Integer imageClassDId) {
        List<ImageClassEEntity> classEEntityList = imageClassERepository.searchClassE(imageClassDId);
        ImageClassEListResponse listResponse = new ImageClassEListResponse();
        listResponse.setClassEEntityList(classEEntityList);
        return listResponse;
    }


}