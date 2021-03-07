package me.esraozturk.mqttlistener.sdk.repository.domain;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;


@MappedSuperclass
public class AbstractEntity implements GenericEntity {

    private UUID id;
    private LocalDateTime createdDateTime;
    private LocalDateTime updatedDateTime;
    private String description;

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(columnDefinition = "BINARY(16)")
    @Access(AccessType.FIELD)
    @Override
    public UUID getId() {
        return id;
    }

    @CreationTimestamp
    @Access(AccessType.FIELD)
    @Column(nullable = false)
    @Override
    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    @UpdateTimestamp
    @Access(AccessType.FIELD)
    @Column(nullable = false)
    @Override
    public LocalDateTime getUpdatedDateTime() {
        return updatedDateTime;
    }

    @Column(length = 512)
    @Override
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AbstractEntity that = (AbstractEntity) o;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
