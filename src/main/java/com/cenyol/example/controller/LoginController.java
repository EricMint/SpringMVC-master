package com.cenyol.example.controller;

import com.cenyol.example.model.PatientEntity;
import com.cenyol.example.model.UserEntity;
import com.cenyol.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by mint on 10/29/17.
 */
@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;


    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("user") UserEntity userEntity) {
        String userName = userEntity.getUserName();
        String password = userEntity.getPassword();
        List<UserEntity> userEntityList = userRepository.searchUserByPassword(userName, password);
        if (!userEntityList.isEmpty()) {
            return "redirect:/patient/list/" + userName;
        }

        return null;
    }



}
