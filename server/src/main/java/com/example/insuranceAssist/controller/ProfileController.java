package com.example.insuranceAssist.controller;

import com.example.insuranceAssist.dto.UserDetailsResponseDTO;
import com.example.insuranceAssist.exception.UserNotFoundException;
import com.example.insuranceAssist.service.ProfileService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/private/profile")
public class ProfileController {

    private final ProfileService profileService;

    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    @GetMapping("/get/{userId}")
    public ResponseEntity<UserDetailsResponseDTO> getDetails(@PathVariable UUID userId) throws UserNotFoundException {
        UserDetailsResponseDTO response = profileService.getDetails(userId);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
