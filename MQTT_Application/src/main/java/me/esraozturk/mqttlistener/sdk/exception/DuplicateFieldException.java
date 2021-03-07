package me.esraozturk.mqttlistener.sdk.exception;

import java.util.Collections;
import java.util.List;

public class DuplicateFieldException extends RuntimeException {

    public DuplicateFieldException(String field) {
        this(Collections.singletonList(field));
    }

    public DuplicateFieldException(List<String> fields) {
        super(fields.toString());
    }

}
