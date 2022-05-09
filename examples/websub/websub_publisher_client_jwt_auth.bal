import ballerina/io;
import ballerina/log;
import ballerina/websubhub;

public function main() returns error? {
    websubhub:PublisherClient publisherClient = check new ("https://localhost:9090/websubhub",
        auth = {
            username: "ballerina",
            issuer: "wso2",
            audience: ["ballerina", "ballerina.org", "ballerina.io"],
            keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
            jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
            customClaims: { "scp": "admin" },
            expTime: 3600,
            signatureConfig: {
                config: {
                    keyFile: "./resources/private.key"
                }
            }
        },
        secureSocket = {
            cert: "./resources/public.crt"
        }
    );

    websubhub:TopicRegistrationSuccess|websubhub:TopicRegistrationError registrationResponse = publisherClient->registerTopic("Ballerina");
    if registrationResponse is websubhub:TopicRegistrationSuccess {
        io:println("Topic registration successful.");
    } else {
        log:printError("Topic registration failed!.", 'error = registrationResponse);
    }

    string payload = "Swan Lake GA Released!";
    websubhub:Acknowledgement|websubhub:UpdateMessageError publishResponse = publisherClient->publishUpdate("Ballerina", payload);
    if publishResponse is websubhub:Acknowledgement {
        io:println("Publish update successful.");
    } else {
        log:printError("Publish update failed!.", 'error = publishResponse);
    }
}
