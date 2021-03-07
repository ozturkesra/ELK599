package me.esraozturk.mqttlistener.sdk.exception;

import java.util.Collections;
import java.util.List;

public class EntityUsedException extends RuntimeException {

    public EntityUsedException(String entity) {
        this(Collections.singletonList(entity));
    }

    public EntityUsedException(List<String> entities) {
        super(entities.toString());
    }

}
