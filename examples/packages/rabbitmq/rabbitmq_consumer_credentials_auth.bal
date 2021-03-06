import ballerina/io;
import ballerinax/rabbitmq;

listener rabbitmq:Listener securedEP = new("localhost", 5671,
    auth = {
        username: "alice",
        password: "alice@123"
    },
    secureSocket = {
        cert: {
            path: "./resources/keystore/truststore.p12",
            password: "ballerina"
        },
        key: {
            path: "./resources/keystore/keystore.p12",
            password: "ballerina"
        }
    }
);

@rabbitmq:ServiceConfig {
    queueName: "demo.security"
}
service rabbitmq:Service on securedEP {
    remote function onMessage(rabbitmq:Message message) {
        string|error messageContent = string:fromBytes(message.content);
        if (messageContent is string) {
            io:println("Received message: ", messageContent);
        }
    }
}
