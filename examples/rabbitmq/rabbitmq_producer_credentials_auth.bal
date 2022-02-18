import ballerina/io;
import ballerinax/rabbitmq;

final rabbitmq:Client securedEP = check new ("localhost", 5671,
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

public function main() returns error? {
    check securedEP->queueDeclare("demo.security");
    string message = "Hello, World!";
    check securedEP->publishMessage({
        content: message.toBytes(),
        routingKey: "demo.security"
    });
    check securedEP->close();
    io:println("Message published successfully.");
}
