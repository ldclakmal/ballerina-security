import ballerina/io;
import ballerinax/nats;

listener nats:Listener securedEP = new ("nats://localhost:4222",
    auth = {
        username: "alice",
        password: "alice@123"
        //token: "s3cr3t"
    },
    secureSocket = {
        cert: "./resources/cert/server.crt",
        key: {
            certFile: "./resources/cert/client.crt",
            keyFile: "./resources/key/client.key"
        }
    }
);

@nats:ServiceConfig {
    subject: "demo.security"
}
isolated service nats:Service on securedEP {
    isolated remote function onMessage(nats:Message message) {
        string|error messageContent = string:fromBytes(message.content);
        if messageContent is string {
            io:println("Received message: ", messageContent);
        }
    }
}
