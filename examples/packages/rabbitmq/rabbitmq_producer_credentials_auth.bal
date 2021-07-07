import ballerina/io;
import ballerinax/rabbitmq;

rabbitmq:Client securedEP = check new("localhost", 5671,
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
    //check securedEP.close();
    io:println("Message published successfully.");
}
