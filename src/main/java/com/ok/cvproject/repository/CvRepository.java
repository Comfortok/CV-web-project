package com.ok.cvproject.repository;

import com.ok.cvproject.model.Cv;
import com.ok.cvproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CvRepository extends JpaRepository<Cv, Long> {
    Optional<Cv> findByUser(User user);
}