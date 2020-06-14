package com.ok.cvproject.controller;

import com.ok.cvproject.dto.LoginForm;
import com.ok.cvproject.dto.SignUpForm;
import com.ok.cvproject.model.Role;
import com.ok.cvproject.model.RoleName;
import com.ok.cvproject.model.User;
import com.ok.cvproject.repository.RoleRepository;
import com.ok.cvproject.repository.UserRepository;
import com.ok.cvproject.security.jwt.JwtProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.Set;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
public class AuthRestAPIs {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtProvider jwtProvider;

    @GetMapping("/signin")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView modelAndView = new ModelAndView("login");
        modelAndView.addObject("loginForm", new LoginForm());
        if (error != null) {
            modelAndView.addObject("error", "true");
        }
        if (logout != null) {
            modelAndView.addObject("logout", "true");
        }
        return modelAndView;
    }

    @PostMapping("/signin")
    public ModelAndView authenticateUser(@Valid @ModelAttribute LoginForm loginRequest, HttpServletRequest request,
                                         Errors errors, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("home");

        if (errors.hasErrors()) {
            return login("error", null);
        }

        Authentication authentication;
        try {
            authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getUsername(),
                        loginRequest.getPassword()
                )
        );
        } catch (BadCredentialsException e) {
            return login("error", null);
        }

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtProvider.generateJwtToken(authentication);
        request.getSession().setAttribute("Authorization", "Bearer " + jwt);
        return modelAndView;
    }

    @GetMapping("/signup")
    public ModelAndView registrationPage() {
        ModelAndView modelAndView = new ModelAndView("registration");
        modelAndView.addObject("userForm", new SignUpForm());
        return modelAndView;
    }

    @PostMapping("/signup")
    public ModelAndView registerUser(@Valid @ModelAttribute SignUpForm signUpRequest) {
        ModelAndView modelAndView = new ModelAndView("registration");
        modelAndView.addObject("userForm", new SignUpForm());
        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            modelAndView.addObject("error", "username exists");
            return modelAndView;
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            modelAndView.addObject("error", "email exists");
            return modelAndView;
        }

        if (!signUpRequest.getConfirmPassword().equals(signUpRequest.getPassword())) {
            modelAndView.addObject("error", "password error");
            return modelAndView;
        }

        User user = new User();
        user.setUsername(signUpRequest.getUsername());
        user.setPassword(encoder.encode(signUpRequest.getPassword()));
        user.setEmail(signUpRequest.getEmail());
        user.setEnabled(true);

        Set<Role> roles = new HashSet<>();
        Role userRole = roleRepository.findByName(RoleName.ROLE_USER)
                .orElseThrow(() -> new RuntimeException("Fail! -> Cause: User Role not found."));
        roles.add(userRole);

        user.setRoles(roles);
        userRepository.save(user);

        modelAndView.setViewName("login");
        modelAndView.addObject("signup", "true");
        modelAndView.addObject("loginForm", new LoginForm());

        return modelAndView;
    }

    @GetMapping("/logout")
    public ModelAndView logout() {
        ModelAndView modelAndView = new ModelAndView("login");
        modelAndView.addObject("loginForm", new LoginForm());
        modelAndView.addObject("logout", "true");
        return modelAndView;
    }
}