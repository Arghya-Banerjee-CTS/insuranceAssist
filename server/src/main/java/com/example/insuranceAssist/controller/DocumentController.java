package com.example.insuranceAssist.controller;

import com.example.insuranceAssist.dto.DocumentResponseDTO;
import com.example.insuranceAssist.service.DocumentService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/private/image")
public class DocumentController {

    private final DocumentService documentService;

    public DocumentController(DocumentService documentService) {
        this.documentService = documentService;
    }

    @PostMapping("/upload")
    public ResponseEntity<?> uploadDocument(@RequestParam("file")MultipartFile file, @RequestBody Map<String, Object> request) throws IOException {
        UUID docId = documentService.uploadDocument(file, request);
        return new ResponseEntity<>(docId, HttpStatus.OK);
    }

    @GetMapping("/download")
    public ResponseEntity<?> getDocuments(@RequestBody Map<String, Object> request) {
        List<DocumentResponseDTO> response = documentService.getDocuments(request);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
