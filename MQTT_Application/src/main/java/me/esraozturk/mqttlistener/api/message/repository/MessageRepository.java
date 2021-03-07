package me.esraozturk.mqttlistener.api.message.repository;

import me.esraozturk.mqttlistener.api.message.repository.custom.MessageRepositoryCustom;
import me.esraozturk.mqttlistener.api.message.repository.domain.Message;
import me.esraozturk.mqttlistener.sdk.repository.GenericRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository extends GenericRepository<Message>, MessageRepositoryCustom {
}
