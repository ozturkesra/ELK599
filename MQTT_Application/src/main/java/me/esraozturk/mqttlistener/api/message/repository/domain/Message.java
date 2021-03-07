package me.esraozturk.mqttlistener.api.message.repository.domain;

import me.esraozturk.mqttlistener.sdk.repository.domain.AbstractEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(
        name = "messages"
)

public class Message extends AbstractEntity {
    private String clientId;
    private String topic;
    private String message;

    @Column(nullable = false)
    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    @Column(nullable = false)
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Column(nullable = false)
    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }
}
