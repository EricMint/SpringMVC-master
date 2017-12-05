package com.bysy.hospital.controller;

import com.bysy.hospital.model.*;
import com.bysy.hospital.request.*;
import com.bysy.hospital.service.PhysicalKuanguanjieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class PhysicalKuanguanjieController {

    @Autowired
    private PhysicalKuanguanjieService physicalKuanguanjieService;


    @ResponseBody
    @RequestMapping(value = "/patient/physical/kuanguanjie/butai/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public PhysicalKuanguanjieButaiEntity physicalKuanguanjieButaiGet(@PathVariable("patientId") Integer patientId) {
        PhysicalKuanguanjieButaiEntity entity = physicalKuanguanjieService.findKuanguanjieButai(patientId);
        return entity;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/kuanguanjie/butai", method = RequestMethod.POST)
    @ResponseBody
    public void physicalKuanguanjieButaiUpdate(@RequestBody PhysicalKuanguanjieButaiRequest request) {
        physicalKuanguanjieService.updateOrCreateKuanguanjieButai(request);
    }

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

    @ResponseBody
    @RequestMapping(value = "/patient/physical/kuanguanjie/huodongdu/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public PhysicalKuanguanjieHuodongduEntity physicalKuanguanjieKuanguanjieHuodongduGet(@PathVariable("patientId") Integer patientId) {
        PhysicalKuanguanjieHuodongduEntity entity = physicalKuanguanjieService.findKuanguanjieHuodongdu(patientId);
        return entity;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/kuanguanjie/huodongdu", method = RequestMethod.POST)
    @ResponseBody
    public void physicalKuanguanjieHuodongduUpdate(@RequestBody PhysicalKuanguanjieHuodongduRequest request) {
        physicalKuanguanjieService.updateOrCreateKuanguanjieHuodongdu(request);
    }

    @ResponseBody
    @RequestMapping(value = "/patient/physical/kuanguanjie/shiyan/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public List<PhysicalKuanguanjieShiyanEntity> physicalKuanguanjieShiyanGet(@PathVariable("patientId") Integer patientId) {
        List<PhysicalKuanguanjieShiyanEntity> entityList = physicalKuanguanjieService.findKuanguanjieShiyan(patientId);
        return entityList;
    }

    @Transactional
    @RequestMapping(value = "/patient/physical/kuanguanjie/shiyan", method = RequestMethod.POST)
    @ResponseBody
    public void physicalKuanguanjieShiyanUpdate(@RequestBody PhysicalKuanguanjieShiyanRequest request) {
        physicalKuanguanjieService.updateOrCreateKuanguanjieShiyan(request);
    }
}