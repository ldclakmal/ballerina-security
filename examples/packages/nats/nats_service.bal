import ballerina/io;
import ballerinax/nats;

listener nats:Listener securedEP = new("nats://localhost:4222",
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
            name: nats:TLS
        }
    }
);

@nats:ServiceConfig {
    subject: "demo.security"
}
service nats:Service on securedEP {
    remote function onMessage(nats:Message message) {
        string|error messageContent = string:fromBytes(message.content);
        if (messageContent is string) {
            io:println("Received message: " + messageContent);
        }
    }
}

// https://github.com/docker-library/docs/tree/master/nats
// https://docs.nats.io/nats-server/configuration/securing_nats/tls
