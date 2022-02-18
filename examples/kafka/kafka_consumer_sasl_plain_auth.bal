import ballerina/io;
import ballerinax/kafka;

const string TOPIC = "demo-security";

listener kafka:Listener securedEP = new ("localhost:9094",
    topics = [TOPIC],
    groupId = "consumer-group-1",
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

isolated service kafka:Service on securedEP {
    isolated remote function onConsumerRecord(kafka:Caller caller, kafka:ConsumerRecord[] records) returns error? {
        io:println("Received message: ", string:fromBytes(records.pop().value));
        check caller->commit();
    }
}
