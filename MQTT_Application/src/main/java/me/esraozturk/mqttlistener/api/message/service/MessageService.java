package me.esraozturk.mqttlistener.api.message.service;


import me.esraozturk.mqttlistener.api.message.repository.MessageRepository;
import me.esraozturk.mqttlistener.api.message.repository.domain.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MessageService {

    private MessageRepository messageRepository;

    @Autowired
    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public Message save(Message entity) {
        Message persistedEntity = messageRepository.save(entity);
        return persistedEntity;
    }

    @Transactional
    public List<Message> getLastTen() {
        return messageRepository.getLastMessages();
    }
}
