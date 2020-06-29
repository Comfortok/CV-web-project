package com.ok.cvproject.controller;

import com.ok.cvproject.model.Article;
import com.ok.cvproject.service.ArticleService;
import com.ok.cvproject.service.UserPrinciple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ArticleController {
    private ArticleService articleService;

    @Autowired
    public ArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @GetMapping("articles")
    public ModelAndView articlesPage(ModelAndView modelAndView) {
        modelAndView.setViewName("articles");
        Iterable<Article> articles = articleService.getAllArticles();
        modelAndView.addObject("allArticles", articles);
        return modelAndView;
    }

    @GetMapping(value = "newArticlePage")
    public ModelAndView articleForm(ModelAndView modelAndView, @ModelAttribute("article") Article article) {
        modelAndView.setViewName("articleForm");
        return modelAndView;
    }

    @PostMapping(value = "addArticle")
    public ModelAndView addNewArticle(@AuthenticationPrincipal UserPrinciple userPrinciple, ModelAndView modelAndView,
                                      @ModelAttribute("article") Article article) {
        articleService.saveArticle(article, userPrinciple);
        modelAndView.setViewName("redirect:/main");
        return modelAndView;
    }

    @GetMapping(value = "articleInfo/{id}")
    public ModelAndView articleInfo(@PathVariable(value = "id") Long id, ModelAndView modelAndView) {
        modelAndView.setViewName("articleInfo");
        modelAndView.addObject("article", articleService.getArticleById(id));
        return modelAndView;
    }

    @RequestMapping(value = "updateArticle/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateArticle(@PathVariable(value = "id") Long id, ModelAndView modelAndView) {
        modelAndView.setViewName("articleForm");
        Article article = articleService.getArticleById(id);
        modelAndView.addObject("article", article);
        return modelAndView;
    }

    @PostMapping(value = "deleteArticle/{id}")
    public ModelAndView deleteArticle(@PathVariable("id") Long id, ModelAndView modelAndView) {
        modelAndView.setViewName("redirect:/articles");
        articleService.deleteById(id);
        return modelAndView;
    }
}