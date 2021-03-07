package me.esraozturk.mqttlistener;

import me.esraozturk.mqttlistener.api.message.service.MessageService;
import me.esraozturk.mqttlistener.mqtt.MqttConnector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableAsync
@EnableCaching
@EnableScheduling
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class MqttlistenerApplication implements CommandLineRunner {


    MessageService messageService;

    @Autowired
    public MqttlistenerApplication(MessageService messageService) {
        this.messageService = messageService;
    }

    public static void main(String[] args) {
        SpringApplication.run(MqttlistenerApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("--------Application Started--------");
        if(Boolean.TRUE.equals(MqttConnector.getInstance(messageService).connect())) {
            System.out.println("Application connected to broker successfully");
        } else {
            System.out.println("Broker Connection failed");
        }

    }
}
