package com.cenyol.example.controller;

import com.cenyol.example.model.*;
import com.cenyol.example.model.aspectj.Performance;
import com.cenyol.example.model.aspectj.PerformanceImpl;
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
public class MainController {

    // 自动装配
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PatientImagingExaminationRecordRepository patientImagingExaminationRecordRepository;

    @Autowired
    private ImagingExaminationCategoryRepository imagingExaminationCategoryRepository;

    @Autowired
    private ImagingExaminationItemRepository imagingExaminationItemRepository;

    @Autowired
    private ImagingExaminationItemOptionRepository imagingExaminationItemOptionRepository;

    // 首页
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    // 用户管理
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String users(ModelMap modelMap) {
        // 找到user表里面的所有记录
        List<UserEntity> userEntityList = userRepository.findAll();

        // 将所有的记录传递给返回的jsp页面
        modelMap.addAttribute("userList", userEntityList);

        // 返回pages目录下的userManage.jsp
        return "userManage";
    }

    // 添加用户表单页面
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser() {
        return "addUser";
    }

    // 添加用户处理
    @RequestMapping(value = "/addUserPost", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity) {
        // 向数据库添加一个用户
        //userRepository.save(userEntity);

        // 向数据库添加一个用户，并将内存中缓存区的数据刷新，立即写入数据库，之后才可以进行访问读取
        userRepository.saveAndFlush(userEntity);

        // 返回重定向页面
        Integer userId = userEntity.getId();
//        return "redirect:/showUser/" + userId;
        return "redirect:/users/";
    }

    // 添加影像检查部位页面
    @RequestMapping(value = "/addImagingRecord/{id}", method = RequestMethod.GET)
    public String addImagingRecord(@PathVariable("id") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);

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
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);

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
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);

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
        return "redirect:/showUser/" + userId;
    }


    // 查看用户详细信息
    // @PathVariable可以收集url中的变量，需匹配的变量用{}括起来
    // 例如：访问 localhost:8080/showUser/1 ，将匹配 userId = 1
    @RequestMapping(value = "/showUser/{userId}", method = RequestMethod.GET)
    public String showUser(@PathVariable("userId") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);
        if (null != userEntity && null != (Integer) userEntity.getPatientNumber()) {
            Integer patientNumber = userEntity.getPatientNumber();
            List<PatientImagingExaminationRecordEntity> recordEntityList = patientImagingExaminationRecordRepository.searchPatientImagingExaminationRecord(patientNumber);
            modelMap.addAttribute("recordEntityList", recordEntityList);
        }

        return "userDetail";
    }

    // 更新用户信息页面
    @RequestMapping(value = "/updateUser/{userId}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("userId") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);
        return "updateUser";
    }

    // 处理用户修改请求
    @RequestMapping(value = "/updateUserPost", method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("user") UserEntity userEntity) {
        userRepository.updateUser(
                userEntity.getPatientNumber(),
                userEntity.getIdNumber(),
                userEntity.getRealName(),
                userEntity.getEthnicity(),
                userEntity.getGender(),
                userEntity.getAge(),
                userEntity.getHeight(),
                userEntity.getWeight(),
                userEntity.getId()
        );
        return "redirect:/users";
    }

    // 删除用户
    @RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("userId") Integer userId) {
        // 删除id为userId的用户
        userRepository.delete(userId);
        // 立即刷新数据库
        userRepository.flush();
        return "redirect:/users";
    }
}