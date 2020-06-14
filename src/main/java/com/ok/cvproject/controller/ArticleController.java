package com.ok.cvproject.controller;

import com.ok.cvproject.model.Article;
import com.ok.cvproject.model.User;
import com.ok.cvproject.repository.ArticleRepository;
import com.ok.cvproject.repository.UserRepository;
import com.ok.cvproject.security.jwt.JwtProvider;
import com.ok.cvproject.service.UserPrinciple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;

@RestController
public class ArticleController {

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JwtProvider jwtProvider;

    private ModelAndView modelAndView = new ModelAndView();

    @PostMapping("/add")
    public ModelAndView addNewArticle(@AuthenticationPrincipal UserPrinciple userPrinciple,
                                      @RequestParam String header,
                                      @RequestParam String text) {

//        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
//        String tokenAtr = (String) request.getSession().getAttribute("Authorization");
//        String token = tokenAtr.split(" ")[1];

        User user = new User();
        user.setId(userPrinciple.getId());

        Article article = new Article();
        article.setHeader(header);
        article.setText(text);
        article.setReleaseDate(LocalDate.now());
        article.setUser(user);
        articleRepository.save(article);
        modelAndView.setViewName("redirect:/main");
        return modelAndView;
    }
}