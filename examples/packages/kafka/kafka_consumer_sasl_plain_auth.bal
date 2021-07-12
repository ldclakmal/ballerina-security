import ballerina/io;
import ballerinax/kafka;

const string TOPIC = "demo-security";

listener kafka:Listener securedEP = new("localhost:9093",
    topics = [TOPIC],
    groupId = "consumer-group-1",
    auth = {
        mechanism: kafka:AUTH_SASL_PLAIN,
        username: "alice",
        password: "alice@123"
    },
    securityProtocol = kafka:PROTOCOL_SASL_PLAINTEXT
);

service kafka:Service on securedEP {
    remote function onConsumerRecord(kafka:Caller caller, kafka:ConsumerRecord[] records) returns error? {
        io:println("Received message: ", string:fromBytes(records.pop().value));
        check caller->commit();
    }
}
