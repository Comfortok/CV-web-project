package com.ok.cvproject.controller;

import com.ok.cvproject.model.Role;
import com.ok.cvproject.model.User;
import com.ok.cvproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;

@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    private ModelAndView modelAndView;

    @GetMapping("/registration")
    public ModelAndView registrationPage() {
        modelAndView = new ModelAndView("registration");
        modelAndView.addObject("userForm", new User());
        return modelAndView;
    }

    @PostMapping("/registration")
    public ModelAndView addNewUser(@ModelAttribute("userForm") User user, Errors errors) {
        modelAndView = new ModelAndView("registration");
        if (errors.hasErrors()) {
            modelAndView.addObject("message", "some errors");
            return modelAndView;
        }
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            modelAndView.addObject("message", "passwords are not equal");
            return modelAndView;
        }
        User userFromDB = userRepository.findByUsername(user.getUsername());
        if (userFromDB != null) {
            modelAndView.addObject("message", "already exists");
            return modelAndView;
        }
        user.setEnabled(true);
        user.setRoles(Collections.singleton(Role.ROLE_USER));
        userRepository.save(user);
        modelAndView.setViewName("redirect:/login");
        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {
        modelAndView = new ModelAndView("login");
        if (error != null) {
            modelAndView.addObject("error", "true");
        }
        if (logout != null) {
            modelAndView.addObject("logout", "true");
        }
        return modelAndView;
    }
}
