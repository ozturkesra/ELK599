package me.esraozturk.mqttlistener.sdk.repository.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.UUID;

public interface GenericEntity extends Serializable {

    UUID getId();

    LocalDateTime getCreatedDateTime();

    LocalDateTime getUpdatedDateTime();

    String getDescription();

    void setDescription(String description);
}
