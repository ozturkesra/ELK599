package me.esraozturk.mqttlistener.api.message.controller;

import me.esraozturk.mqttlistener.api.message.controller.dto.MessageDTO;
import me.esraozturk.mqttlistener.api.message.repository.domain.Message;
import me.esraozturk.mqttlistener.api.message.service.MessageService;
import me.esraozturk.mqttlistener.sdk.api.ApiResponse;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/message")
public class MessageController {

    private MessageService messageService;


    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<UUID>> save(@Valid @RequestBody MessageDTO messageDTO) {
        Message message = new Message();
        message.setClientId(messageDTO.getClientId());
        message.setMessage(messageDTO.getMessage());
        message.setTopic(messageDTO.getTopic());
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(messageService.save(message).getId()));
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<Message>>> getLastTenMessage() {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(messageService.getLastTen()));
    }
}
