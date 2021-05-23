import ballerinax/nats;

public function main() returns error? {
    nats:Client securedEP = check new("nats://localhost:4222",
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
    string message = "Hello, World!";
    check securedEP->publishMessage({
        content: message.toBytes(),
        subject: "demo.security"
    });
    check securedEP.close();
}
