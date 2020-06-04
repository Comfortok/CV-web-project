package com.ok.cvproject.controller;

import com.ok.cvproject.model.Article;
import com.ok.cvproject.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {

    @Autowired
    private ArticleRepository articleRepository;

    private ModelAndView modelAndView = new ModelAndView();

    @GetMapping({"/", "/home"})
    public ModelAndView greeting(@RequestParam(name = "name", required = false, defaultValue = "Default User") String name) {
        modelAndView.addObject("name", name);
        modelAndView.setViewName("home");
        return modelAndView;
    }

    @GetMapping("/main")
    public ModelAndView home() {
        Iterable<Article> articles = articleRepository.findAll();
        modelAndView.addObject("allArticles", articles);
        modelAndView.setViewName("main");
        return modelAndView;
    }
}