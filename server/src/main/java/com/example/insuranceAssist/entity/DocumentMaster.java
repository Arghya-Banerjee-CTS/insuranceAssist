package com.example.insuranceAssist.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.UuidGenerator;

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

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "claim_id", nullable = false)
    private UUID claimId;

}
