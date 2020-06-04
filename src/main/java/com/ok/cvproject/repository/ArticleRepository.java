package com.ok.cvproject.repository;

import com.ok.cvproject.model.Article;
import org.springframework.data.repository.CrudRepository;

public interface ArticleRepository extends CrudRepository<Article, Long> {
}