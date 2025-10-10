package com.example.insuranceAssist.service;

import com.example.insuranceAssist.dto.DocumentResponseDTO;
import com.example.insuranceAssist.entity.DocumentMaster;
import com.example.insuranceAssist.repository.DocumentRepository;
import com.example.insuranceAssist.utils.DocumentUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class DocumentService {

    private final DocumentRepository documentRepository;

    public DocumentService(DocumentRepository documentRepository) {
        this.documentRepository = documentRepository;
    }

    public UUID uploadDocument(MultipartFile file, Map<String, Object> request) throws IOException {

        byte[] fileBytes = file.getBytes();
        UUID claimId = (UUID) request.get("claimId");

        byte[] dataToStore;
        if(file.getContentType().equalsIgnoreCase("application/pdf")){
            dataToStore = fileBytes;
        }
        else{
            dataToStore = DocumentUtils.compressImage(fileBytes);
        }

        DocumentMaster doc = new DocumentMaster(
                 file.getName(),
                 file.getContentType(),
                 dataToStore,
                 claimId,
                 LocalDateTime.now()
        );

        DocumentMaster document = documentRepository.save(doc);
        return document.getId();

    }

    public List<DocumentResponseDTO> getDocuments(Map<String, Object> request) {

        UUID claimId = (UUID) request.get("claimId");
        List<DocumentMaster> docs = documentRepository.findByClaimId(claimId);

        List<DocumentResponseDTO> response = new ArrayList<>();
        for(DocumentMaster doc: docs) {
            DocumentResponseDTO docDTO = new DocumentResponseDTO(
                    doc.getId(),
                    doc.getName(),
                    doc.getType(),
                    doc.getData()
            );
            response.add(docDTO);
        }
        return response;

    }
}
