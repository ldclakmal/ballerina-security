import ballerina/io;
import ballerinax/stan;

final stan:Client securedEP = check new ("nats://localhost:4222",
    clusterId = "b7a_cluster",
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
    string nuid = check securedEP->publishMessage({
        content: message.toBytes(),
        subject: "demo.security"
    });
    check securedEP.close();
    io:println("NUID: ", nuid);
    io:println("Message published successfully.");
}
