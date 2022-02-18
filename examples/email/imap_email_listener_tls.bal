import ballerina/email;
import ballerina/io;

listener email:ImapListener securedEP = check new ({
    host: "127.0.0.1",
    port: 3993,
    username: "bob",
    password: "bob123",
    pollingInterval: 15,
    secureSocket: {
        cert: "./resources/cert/server.crt",
        protocol: {
            name: email:TLS,
            versions: ["TLSv1.2", "TLSv1.1"]
        },
        verifyHostName: false
    }
});

isolated service on securedEP {
    isolated remote function onMessage(email:Message email) {
        io:println("Received email: ", email.subject);
    }
}
