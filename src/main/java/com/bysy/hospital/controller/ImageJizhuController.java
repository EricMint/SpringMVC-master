package com.bysy.hospital.controller;

import com.bysy.hospital.model.ImageJizhuEntity;
import com.bysy.hospital.request.ImageJizhuRequest;
import com.bysy.hospital.service.ImageJizhuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class ImageJizhuController {

    @Autowired
    private ImageJizhuService imageJizhuService;

    @ResponseBody
    @RequestMapping(value = "/patient/image/jizhu/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public List<ImageJizhuEntity> imageJizhuGet(@PathVariable("patientId") Integer patientId) {
        List<ImageJizhuEntity> entityList = imageJizhuService.findJizhuEntityList(patientId);
        return entityList;
    }

    @Transactional
    @RequestMapping(value = "/patient/image/jizhu", method = RequestMethod.POST)
    @ResponseBody
    public void imageJizhuUpdateOrCreate(@RequestBody ImageJizhuRequest request) {
        imageJizhuService.updateOrCreateJizhu(request);
    }

}