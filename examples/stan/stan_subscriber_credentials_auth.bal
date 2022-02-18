import ballerina/io;
import ballerinax/stan;

listener stan:Listener securedEP = new ("nats://localhost:4222",
    clusterId = "b7a_cluster",
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

@stan:ServiceConfig {
    subject: "demo.security"
}
isolated service stan:Service on securedEP {
    isolated remote function onMessage(stan:Message message) {
        string|error messageContent = string:fromBytes(message.content);
        if messageContent is string {
            io:println("Received message: ", messageContent);
        }
    }
}
