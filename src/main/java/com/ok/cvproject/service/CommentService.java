package com.ok.cvproject.service;

import com.ok.cvproject.model.Comment;
import com.ok.cvproject.model.User;
import com.ok.cvproject.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CommentService {
    private CommentRepository commentRepository;

    @Autowired
    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    public Comment createComment(Comment comment, User user) {
        comment.setUser(user);
        return commentRepository.save(comment);
    }
}