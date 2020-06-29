package com.ok.cvproject.model;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
@Table
@Data
@ToString(of = {"id", "header"})
@EqualsAndHashCode(of = {"id"})
@NoArgsConstructor
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String header;
    private String text;

    @Column(nullable = false, updatable = false)
    private LocalDate releaseDate;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false, updatable = false)
    private User user;

    @OneToMany(mappedBy = "article", orphanRemoval = true)
    private Set<Comment> comments;

    public String getUserName() {
        return user != null ? user.getUsername() : "empty";
    }
}