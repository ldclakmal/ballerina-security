import ballerina/email;
import ballerina/io;

final email:SmtpClient securedEP = check new ("127.0.0.1", "alice", "alice123", {
    port: 3465,
    secureSocket: {
        cert: "./resources/cert/server.crt",
        protocol: {
            name: email:TLS,
            versions: ["TLSv1.2", "TLSv1.1"]
        },
        verifyHostName: false
    }
});

public function main() returns error? {
    email:Message email = {
        to: "bob",
        subject: "Hello, World!",
        body: "This is a sample email.",
        'from: "author@email.com"
    };
    check securedEP->sendMessage(email);
    io:println("Email sent successfully.");
}
