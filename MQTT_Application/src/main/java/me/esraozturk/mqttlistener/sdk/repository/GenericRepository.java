package me.esraozturk.mqttlistener.sdk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;
import java.util.UUID;

@NoRepositoryBean
public interface GenericRepository<E extends Serializable> extends JpaRepository<E, UUID>, QuerydslPredicateExecutor<E> {
}
