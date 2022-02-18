import ballerina/io;
import ballerinax/rabbitmq;

listener rabbitmq:Listener securedEP = new ("localhost", 5671,
    auth = {
        username: "alice",
        password: "alice@123"
    },
    secureSocket = {
        cert: "./resources/cert/server.crt",
        key: {
            certFile: "./resources/cert/client.crt",
            keyFile: "./resources/key/client.key"
        },
        protocol: {
            name: rabbitmq:TLS
        }
    }
);

@rabbitmq:ServiceConfig {
    queueName: "demo.security"
}
isolated service rabbitmq:Service on securedEP {
    isolated remote function onMessage(rabbitmq:Message message) {
        string|error messageContent = string:fromBytes(message.content);
        if messageContent is string {
            io:println("Received message: ", messageContent);
        }
    }
}
