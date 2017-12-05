package com.bysy.hospital.controller;

import com.bysy.hospital.model.PhysicalKuanguanjieJixingEntity;
import com.bysy.hospital.model.PhysicalKuanguanjieYatongEntity;
import com.bysy.hospital.request.PhysicalKuanguanjieJixingRequest;
import com.bysy.hospital.request.PhysicalKuanguanjieYatongRequest;
import com.bysy.hospital.service.PhysicalKuanguanjieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;


@Controller
public class PhysicalKuanguanjieController {

    @Autowired
    private PhysicalKuanguanjieService physicalKuanguanjieService;


    @ResponseBody
    @RequestMapping(value = "/patient/physical/kuanguanjie/jixing/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public PhysicalKuanguanjieJixingEntity physicalKuanguanjieJixingGet(@PathVariable("patientId") Integer patientId) {
        PhysicalKuanguanjieJixingEntity entity = physicalKuanguanjieService.findKuanguanjieJixing(patientId);
        return entity;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/kuanguanjie/jixing", method = RequestMethod.POST)
    @ResponseBody
    public void physicalKuanguanjieJixingUpdate(@RequestBody PhysicalKuanguanjieJixingRequest request) {
        physicalKuanguanjieService.updateOrCreateKuanguanjieJixing(request);
    }

    @ResponseBody
    @RequestMapping(value = "/patient/physical/kuanguanjie/yatong/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public PhysicalKuanguanjieYatongEntity physicalKuanguanjieYatongGet(@PathVariable("patientId") Integer patientId) {
        PhysicalKuanguanjieYatongEntity entity = physicalKuanguanjieService.findKuanguanjieYatong(patientId);
        return entity;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/kuanguanjie/yatong", method = RequestMethod.POST)
    @ResponseBody
    public void physicalKuanguanjieYatongUpdate(@RequestBody PhysicalKuanguanjieYatongRequest request) {
        physicalKuanguanjieService.updateOrCreateKuanguanjieYatong(request);
    }

}