package com.bysy.hospital.controller;

import com.bysy.hospital.model.UserEntity;
import com.bysy.hospital.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String login(@RequestParam String userName, @RequestParam String password) {
        List<UserEntity> userEntityList = userRepository.searchUserByPassword(userName, password);
        if (!userEntityList.isEmpty()) {
            UserEntity logInUser = userEntityList.get(0);
            String identity = logInUser.getRole().equals("manager") ? "isManager" : "notManager";
            return "redirect:/patient/list/" + identity;
        }

        return null;
    }


}
