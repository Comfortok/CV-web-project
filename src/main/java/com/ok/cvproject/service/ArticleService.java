package com.ok.cvproject.service;

import com.ok.cvproject.model.Article;
import com.ok.cvproject.model.User;
import com.ok.cvproject.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class ArticleService {
    private ArticleRepository articleRepository;

    @Autowired
    public ArticleService(ArticleRepository articleRepository) {
        this.articleRepository = articleRepository;
    }

    public Article saveArticle(Article article, UserPrinciple userPrinciple) {
        User user = new User();
        user.setId(userPrinciple.getId());
        if (article.getId() == null) {
            article.setUser(user);
            article.setReleaseDate(LocalDate.now());
        }
        articleRepository.save(article);
        return article;
    }

    public List<Article> getAllArticles() {
        return articleRepository.findAll();
    }

    public Article getArticleById(Long id) {
        return articleRepository.getOne(id);
    }

    public void deleteById(Long id) {
        articleRepository.deleteById(id);
    }
}