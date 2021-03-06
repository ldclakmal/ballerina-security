import ballerina/io;
import ballerinax/nats;

nats:Client securedEP = check new("nats://localhost:4222",
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

public function main() returns error? {
    string message = "Hello, World!";
    check securedEP->publishMessage({
        content: message.toBytes(),
        subject: "demo.security"
    });
    check securedEP.close();
    io:println("Message published successfully.");
}
