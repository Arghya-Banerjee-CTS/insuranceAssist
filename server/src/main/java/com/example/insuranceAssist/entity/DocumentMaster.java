package com.example.insuranceAssist.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.UuidGenerator;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "document_master")
@Data
public class DocumentMaster {

    @Id
    @GeneratedValue
    @UuidGenerator
    private UUID id;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    private String type;

    @Lob
    @Column(name = "data")
    private byte[] data;

    @Column(name = "uploaded_at")
    private LocalDateTime uploadedAt;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "claim_id", nullable = false)
    private UUID claimId;

    public DocumentMaster(String name, String type, byte[] data, UUID claimId, LocalDateTime uploadedAt) {
        this.name = name;
        this.type = type;
        this.data = data;
        this.claimId = claimId;
        this.uploadedAt = uploadedAt;
    }
}
