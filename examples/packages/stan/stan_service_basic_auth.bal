import ballerina/io;
import ballerinax/stan;

// TODO: Retry, once https://github.com/ballerina-platform/ballerina-standard-library/issues/1423 is fixed.
listener stan:Listener securedEP = new("nats://localhost:4222",
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
        },
        protocol: {
            name: stan:TLS
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
            io:println("Received message: " + messageContent);
        }
    }
}
