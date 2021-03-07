package me.esraozturk.mqttlistener.api.message.repository.custom;

import me.esraozturk.mqttlistener.api.message.repository.domain.Message;
import me.esraozturk.mqttlistener.api.message.repository.domain.QMessage;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public class MessageRepositoryImpl extends QuerydslRepositorySupport implements MessageRepositoryCustom {

    public MessageRepositoryImpl() {
        super(Message.class);
    }


    @Override
    public Optional<Message> findByID(UUID id) {
        return Optional.ofNullable(from(QMessage.message1)
                .where(QMessage.message1.id.eq(id))
                .fetchOne());
    }

    @Override
    public List<Message> findByIDs(List<UUID> ids) {
        return from(QMessage.message1)
                .where(QMessage.message1.id.in(ids))
                .fetch();
    }

    @Override
    public List<Message> findAll() {
        return from(QMessage.message1)
                .fetch();
    }

    @Override
    public List<Message> findAll(Message Message) {
        return from(QMessage.message1)
                .where(QMessage.message1.id.eq(Message.getId()))
                .fetch();
    }

    @Override
    public List<Message> getLastMessages() {
        return from(QMessage.message1)
                .where(QMessage.message1.topic.eq("/device/beacons"))
                .orderBy()
                .limit(100)
                .fetch();
    }
}
