import ballerina/io;
import ballerinax/nats;

final nats:Client securedEP = check new ("nats://localhost:4222",
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

public function main() returns error? {
    string message = "Hello, World!";
    check securedEP->publishMessage({
        content: message.toBytes(),
        subject: "demo.security"
    });
    check securedEP.close();
    io:println("Message published successfully.");
}
