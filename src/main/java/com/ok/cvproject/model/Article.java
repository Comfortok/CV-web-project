package com.ok.cvproject.model;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "article")
@Getter
@Setter
@ToString(of = {"id", "header"})
@EqualsAndHashCode(of = {"id"})
@NoArgsConstructor
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String header;
    private String text;
    private LocalDate releaseDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    public String getUserName() {
        return user != null ? user.getUsername() : "empty";
    }
}