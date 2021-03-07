package me.esraozturk.mqttlistener.sdk.exception;

import me.esraozturk.mqttlistener.sdk.repository.domain.GenericEntity;

import java.util.UUID;

public class EntityNotFoundException extends RuntimeException {

    public EntityNotFoundException(Class<? extends GenericEntity> clazz, UUID id) {
        super(String.format("{entity:%s, id:%s}", clazz.getSimpleName(), id.toString()));
    }

}
