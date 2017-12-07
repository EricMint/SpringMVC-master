package com.bysy.hospital.controller;

import com.bysy.hospital.model.ImageGuguceEntity;
import com.bysy.hospital.model.ImageKuanjiuceEntity;
import com.bysy.hospital.request.ImageGuguceRequest;
import com.bysy.hospital.request.ImageKuanjiuceRequest;
import com.bysy.hospital.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class ImageController {

    @Autowired
    private ImageService imageService;


    @ResponseBody
    @RequestMapping(value = "/patient/image/kuanjiuce/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public List<ImageKuanjiuceEntity> imageKuanjiuceGet(@PathVariable("patientId") Integer patientId) {
        List<ImageKuanjiuceEntity> entityList = imageService.findKuanjiuce(patientId);
        return entityList;
    }

    @Transactional
    @RequestMapping(value = "/patient/image/kuanjiuce", method = RequestMethod.POST)
    @ResponseBody
    public void imageKuanjiuceUpdate(@RequestBody ImageKuanjiuceRequest request) {
        imageService.updateOrCreateKuanjiuce(request);
    }

    @ResponseBody
    @RequestMapping(value = "/patient/image/guguce/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public List<ImageGuguceEntity> imageGuguceGet(@PathVariable("patientId") Integer patientId) {
        List<ImageGuguceEntity> entityList = imageService.findGuguce(patientId);
        return entityList;
    }

    @Transactional
    @RequestMapping(value = "/patient/image/guguce", method = RequestMethod.POST)
    @ResponseBody
    public void imageGuguceUpdate(@RequestBody ImageGuguceRequest request) {
        imageService.updateOrCreateGuguce(request);
    }
}