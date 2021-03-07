package me.esraozturk.mqttlistener.mqtt;

import me.esraozturk.mqttlistener.api.message.repository.domain.Message;
import me.esraozturk.mqttlistener.api.message.service.MessageService;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class MqttConnector implements MqttCallback {

    MessageService messageService;
    MqttClient client;

    private static MqttConnector instance = null;


    private String MQTT_USER_NAME     = "mqttuser";
    private String MQTT_USER_PASSWORD = "******";
    private String LISTEN_TOPIC       = "#";
    private String BROKER_URL         = "ssl://mqtt.esraozturk.me:8883";
    private String CLIENT_ID          = "ListenerServer";

    private MemoryPersistence persistence = new MemoryPersistence();

    public MqttConnector() {
        try {
            this.client = new MqttClient(BROKER_URL, CLIENT_ID, persistence);
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

    public static MqttConnector getInstance(MessageService messageService) {
        if(instance == null) {
            instance = new MqttConnector();
            instance.messageService = messageService;
        }
        return instance;
    }

    private MqttConnectOptions getClientOptions () {
        MqttConnectOptions connOpts = new MqttConnectOptions();
        connOpts.setCleanSession(true);
        connOpts.setUserName(this.MQTT_USER_NAME);
        connOpts.setPassword(this.MQTT_USER_PASSWORD.toCharArray());
        return connOpts;
    }

    public boolean connect() {
        boolean state = false;
        try {
            client.setCallback(this);
            client.connect(getClientOptions());
            if(Boolean.TRUE.equals(client.isConnected())) {
                state = true;
                client.subscribe(this.LISTEN_TOPIC);
            }
        } catch (MqttSecurityException e) {
            e.printStackTrace();
        } catch (MqttException e) {
            e.printStackTrace();
        }
        return state;
    }

    @Override
    public void connectionLost(Throwable throwable) { }

    @Override
    public void messageArrived(String topic, MqttMessage mqttMessage) {
        System.out.println(String.format("Incoming Message from topic: %s , message: %s",topic,mqttMessage.toString()));
        Message message = new Message();
        message.setTopic(topic);
        message.setMessage(mqttMessage.toString());
        message.setClientId("MobileDevice");
        messageService.save(message);
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) { }
}
