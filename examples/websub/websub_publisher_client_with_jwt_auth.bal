import ballerina/log;
import ballerina/websubhub;

public function main() returns error? {
    websubhub:PublisherClient publsherClient = check new ("https://localhost:9090/websubhub", {
        auth: {
            username: "ballerina",
            issuer: "wso2",
            audience: ["ballerina", "ballerina.org", "ballerina.io"],
            keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
            jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
            customClaims: { "scp": "hello" },
            expTime: 3600,
            signatureConfig: {
                config: {
                    keyFile: "../resources/private.key"
                }
            }
        },
        secureSocket: {
            cert: "../resources/public.crt"
        }
    });

    websubhub:TopicRegistrationSuccess|websubhub:TopicRegistrationError registrationResponse = publsherClient->registerTopic("Ballerina");
    if (registrationResponse is websubhub:TopicRegistrationSuccess) {
        log:printInfo("Topic registration successful. Body: '" + registrationResponse.body.toString() + "'.");
    } else {
        log:printError("Topic registration failed!.", 'error = registrationResponse);
    }


    websubhub:Acknowledgement|websubhub:UpdateMessageError notifyResponse = publsherClient->notifyUpdate("Ballerina");
    if (notifyResponse is websubhub:Acknowledgement) {
        log:printInfo("Notify update successful. Body: '" + notifyResponse.body.toString() + "'.");
    } else {
        log:printError("Notify update failed!.", 'error = notifyResponse);
    }

    map<string> params = { event: "Swan Lake GA Released!"};
    websubhub:Acknowledgement|websubhub:UpdateMessageError publishResponse = publsherClient->publishUpdate("Ballerina", params);
    if (publishResponse is websubhub:Acknowledgement) {
        log:printInfo("Publish update successful. Body: '" + publishResponse.body.toString() + "'.");
    } else {
        log:printError("Publish update failed!.", 'error = publishResponse);
    }
}
