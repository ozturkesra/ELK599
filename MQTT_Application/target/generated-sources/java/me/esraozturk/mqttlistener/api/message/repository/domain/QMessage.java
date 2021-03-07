package me.esraozturk.mqttlistener.api.message.repository.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QMessage is a Querydsl query type for Message
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QMessage extends EntityPathBase<Message> {

    private static final long serialVersionUID = -1571879578L;

    public static final QMessage message1 = new QMessage("message1");

    public final me.esraozturk.mqttlistener.sdk.repository.domain.QAbstractEntity _super = new me.esraozturk.mqttlistener.sdk.repository.domain.QAbstractEntity(this);

    public final StringPath clientId = createString("clientId");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdDateTime = _super.createdDateTime;

    //inherited
    public final StringPath description = _super.description;

    //inherited
    public final ComparablePath<java.util.UUID> id = _super.id;

    public final StringPath message = createString("message");

    public final StringPath topic = createString("topic");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedDateTime = _super.updatedDateTime;

    public QMessage(String variable) {
        super(Message.class, forVariable(variable));
    }

    public QMessage(Path<? extends Message> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMessage(PathMetadata metadata) {
        super(Message.class, metadata);
    }

}

