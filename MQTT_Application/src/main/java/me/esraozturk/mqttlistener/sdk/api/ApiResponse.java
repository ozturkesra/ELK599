package me.esraozturk.mqttlistener.sdk.api;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.time.LocalDateTime;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> implements Serializable {

    private T data;
    private Error error;
    private LocalDateTime timestamp;

    public ApiResponse() {
        this(null, null);
    }

    public ApiResponse(T data) {
        this(data, null);
    }

    public ApiResponse(Error error) {
        this(null, error);
    }

    public ApiResponse(T data, Error error) {
        this.data = data;
        this.error = error;
        this.timestamp = LocalDateTime.now();
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Error getError() {
        return error;
    }

    public void setError(Error error) {
        this.error = error;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

}
