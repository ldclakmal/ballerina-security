import ballerina/io;
import ballerinax/stan;

listener stan:Listener securedEP = new("nats://localhost:4222",
    clusterId = "b7a_cluster",
    auth = {
        username: "alice",
        password: "alice@123"
        //token: "s3cr3t"
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

@stan:ServiceConfig {
    subject: "demo.security"
}
service stan:Service on securedEP {
    remote function onMessage(stan:Message message) {
        string|error messageContent = string:fromBytes(message.content);
        if (messageContent is string) {
            io:println("Received message: ", messageContent);
        }
    }
}
