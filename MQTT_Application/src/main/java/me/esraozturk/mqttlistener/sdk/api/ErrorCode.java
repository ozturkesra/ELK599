package me.esraozturk.mqttlistener.sdk.api;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ErrorCode {

    INVALID_METHOD_ARGUMENT(-1001, "INVALID_METHOD_ARGUMENT"),
    ENTITY_NOT_FOUND(-1002, "ENTITY_NOT_FOUND"),
    DUPLICATE_FIELD(-1003, "DUPLICATE_FIELD"),
    USER_NOT_FOUND(-1004, "USER_NOT_FOUND"),
    INVALID_REFRESH_TOKEN(-1005, "INVALID_REFRESH_TOKEN"),
    INVALID_PASSWORD_RESET_TOKEN(-1006, "INVALID_PASSWORD_RESET_TOKEN"),
    MEDIA_TYPE_NOT_SUPPORTED(-1007, "MEDIA_TYPE_NOT_SUPPORTED"),
    REQUESTED_MEDIA_NOT_FOUND(-1008, "REQUESTED_MEDIA_NOT_FOUND"),
    PLATFORM_NOT_ALLOWED(-1009, "PLATFORM_NOT_ALLOWED"),
    ENTITY_USED(-1010, "ENTITY_USED"),
    EMAIL_CANNOT_BE_SEND(-1011, "EMAIL_CANNOT_BE_SEND");

    private int code;
    private String message;

    ErrorCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

}