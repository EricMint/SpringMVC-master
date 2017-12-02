package com.bysy.hospital.controller;

import com.bysy.hospital.model.PatientEntity;
import com.bysy.hospital.model.ScoreWomacEntity;
import com.bysy.hospital.request.ScoreWomacRequest;
import com.bysy.hospital.service.PatientService;
import com.bysy.hospital.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;


@Controller
public class ScoreController {

    @Autowired
    private PatientService patientService;

    @Autowired
    private ScoreService scoreService;


    @RequestMapping(value = "/score/womac/{patientId}", method = RequestMethod.GET)
    public String showScoreWomac(@PathVariable("patientId") Integer patientId, ModelMap modelMap) {
        PatientEntity patientEntity = patientService.getPatientById(patientId);
        modelMap.addAttribute("patient", patientEntity);
        return "scoreWomac";
    }

    @ResponseBody
    @RequestMapping(value = "/score/womac-get/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public List<ScoreWomacEntity> scoreWomacGet(@PathVariable("patientId") Integer patientId) {
        return scoreService.getScoreWomacList(patientId);
    }

    @Transactional
    @RequestMapping(value = "/score/womac", method = RequestMethod.POST)
    @ResponseBody
    public void scoreWomacCreateOrUpdate(@RequestBody ScoreWomacRequest request) {
        scoreService.updateOrCreateScoreWomac(request);
    }


}