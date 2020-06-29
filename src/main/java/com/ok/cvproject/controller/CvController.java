package com.ok.cvproject.controller;

import com.ok.cvproject.model.Cv;
import com.ok.cvproject.service.CvService;
import com.ok.cvproject.service.UserPrinciple;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

@RestController
@RequestMapping("cv")
public class CvController {
    private CvService cvService;

    @Autowired
    public CvController(CvService cvService) {
        this.cvService = cvService;
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(LocalDate.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping
    public ResponseEntity<?> allCvs(ModelAndView modelAndView) {
        modelAndView.setViewName("allCvs");
        Iterable<Cv> cvs = cvService.getAllCvs();
        modelAndView.addObject("allCvs", cvs);
        return ResponseEntity.ok(cvs);
    }

    @PostMapping
    public ResponseEntity<?> createCv(@RequestBody Cv cv,
                                      @AuthenticationPrincipal UserPrinciple userPrinciple) {
        return ResponseEntity.ok(cvService.createCv(cv, userPrinciple));
    }

    @GetMapping("{id}")
    public ResponseEntity<?> cvInfo(@PathVariable("id") Cv cv) {
        return ResponseEntity.ok(cvService.getCv(cv));
    }

    @PutMapping("{id}")
    public ResponseEntity<?> updateCv(@AuthenticationPrincipal UserPrinciple userPrinciple,
                                      @PathVariable("id") Cv cvFromDb,
                                      @RequestBody Cv cv) {
        BeanUtils.copyProperties(cv, cvFromDb, "id");
        return ResponseEntity.ok(cvService.createCv(cvFromDb, userPrinciple));
    }

    @DeleteMapping("{id}")
    public ResponseEntity<?> deleteCv(@PathVariable("id") Cv cv) {
        cvService.deleteCv(cv);
        return ResponseEntity.ok(HttpStatus.OK);
    }
}