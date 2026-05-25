package ru.ivamly.migration.entity;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.UUID;

@Entity
public class License {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    private LocalDate endDate;

    @OneToOne(mappedBy = "license")
    private Author author;
}
