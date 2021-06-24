import ballerina/io;
import ballerinax/kafka;

const string TOPIC = "demo-security";
const string MESSAGE = "Hello, World!";

kafka:Producer producer = check new("localhost:9093",
    auth = {
        mechanism: kafka:AUTH_SASL_PLAIN,
        username: "alice",
        password: "alice@123"
    },
    securityProtocol = kafka:PROTOCOL_SASL_PLAINTEXT
);

public function main() returns error? {
    check producer->send({ topic: TOPIC, value: MESSAGE.toBytes() });
    check producer->'flush();
    io:println("Message published successfully.");
}
