package com.example.insuranceAssist.service;

import com.example.insuranceAssist.dto.RegistrationRequestDTO;
import com.example.insuranceAssist.entity.RoleMaster;
import com.example.insuranceAssist.entity.UserMaster;
import com.example.insuranceAssist.repository.RoleMasterRepository;
import com.example.insuranceAssist.repository.UserMasterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class RegistrationService {

    @Autowired
    private UserMasterRepository userMasterRepository;
    @Autowired
    private RoleMasterRepository roleMasterRepository;

    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

    public UUID register(RegistrationRequestDTO request) {

        request.setPassword(encoder.encode(request.getPassword()));
        String[] emailParts = request.getEmail().split("@");
        int atInd = emailParts[1].indexOf('.');
        String username = emailParts[0] + emailParts[1].substring(0, atInd);

        RoleMaster clientRole = roleMasterRepository.findById(1L).orElseThrow();

        UserMaster user = new UserMaster(
                username,
                request.getPassword(),
                request.getName(),
                request.getGender(),
                request.getDob(),
                request.getEmail(),
                request.getPhone(),
                request.getAddress(),
                clientRole
        );

        return userMasterRepository.save(user).getId();
    }
}
