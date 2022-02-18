import ballerina/io;
import ballerinax/kafka;

const string TOPIC = "demo-security";
const string MESSAGE = "Hello, World!";

final kafka:Producer producer = check new ("localhost:9094",
    auth = {
        mechanism: kafka:AUTH_SASL_PLAIN,
        username: "alice",
        password: "alice@123"
    },
    securityProtocol = kafka:PROTOCOL_SSL,
    secureSocket = {
        cert: "./resources/cert/server.crt",
        key: {
            certFile: "./resources/cert/client.crt",
            keyFile: "./resources/key/client.key"
        },
        protocol: {
            name: kafka:TLS
        }
    }
);

public function main() returns error? {
    check producer->send({ topic: TOPIC, value: MESSAGE.toBytes() });
    check producer->'flush();
    io:println("Message published successfully.");
}
