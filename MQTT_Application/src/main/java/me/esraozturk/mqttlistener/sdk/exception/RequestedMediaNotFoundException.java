package me.esraozturk.mqttlistener.sdk.exception;

public class RequestedMediaNotFoundException extends RuntimeException {

    public RequestedMediaNotFoundException(String url) {
        super(String.format("Requested media %s not found!", url));
    }

}
