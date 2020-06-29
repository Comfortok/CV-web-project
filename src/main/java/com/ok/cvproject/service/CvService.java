package com.ok.cvproject.service;

import com.ok.cvproject.model.Cv;
import com.ok.cvproject.model.User;
import com.ok.cvproject.repository.CvRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CvService {
    private CvRepository cvRepository;

    @Autowired
    public CvService(CvRepository cvRepository) {
        this.cvRepository = cvRepository;
    }

    public Iterable<Cv> getAllCvs() {
        return cvRepository.findAll();
    }

    public Cv createCv(Cv cv, UserPrinciple userPrinciple) {
        User user = new User();
        user.setId(userPrinciple.getId());
        cv.setUser(user);
        return cvRepository.save(cv);
    }

    public Cv getCv(Cv cv) {
        return cvRepository.getOne(cv.getId());
    }

    public void deleteCv(Cv cv) {
        cvRepository.delete(cv);
    }
}