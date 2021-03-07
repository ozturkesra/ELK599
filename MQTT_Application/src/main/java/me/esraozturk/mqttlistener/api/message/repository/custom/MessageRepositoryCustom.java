package me.esraozturk.mqttlistener.api.message.repository.custom;


import me.esraozturk.mqttlistener.api.message.repository.domain.Message;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

import java.util.Optional;
import java.util.UUID;

@NoRepositoryBean
public interface MessageRepositoryCustom {

    Optional<Message> findByID(UUID id);

    List<Message> findByIDs(List<UUID> ids);

    List<Message> findAll();

    List<Message> findAll(Message Message);

    List<Message> getLastMessages();

}
