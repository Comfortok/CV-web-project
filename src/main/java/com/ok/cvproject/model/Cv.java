package com.ok.cvproject.model;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "cv")
@Getter
@Setter
@ToString(of = {"id", "name", "skills"})
@EqualsAndHashCode(of = {"id"})
@NoArgsConstructor
public class Cv {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(mappedBy = "cv")
    private User user;

    private String name;
    private String surname;
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private LocalDate birthDate;
    private String skills;
}