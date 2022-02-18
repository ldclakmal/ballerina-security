import ballerina/log;
import ballerina/websub;

listener websub:Listener securedSubscriber = new (8080,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

@websub:SubscriberServiceConfig {
    target: [
        "https://localhost:9090/websubhub", "Ballerina"
    ],
    callback: "https://localhost:8080/subscriber",
    secret: "b745e11a57e9",
    httpConfig: {
        auth: {
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
        secureSocket: {
            cert: "./resources/public.crt"
        }
    }
}
isolated service /subscriber on securedSubscriber {
    isolated remote function onEventNotification(websub:ContentDistributionMessage event) returns websub:Acknowledgement {
        log:printInfo("Event notified with content: '" + event.content.toString() + "'.");
        websub:Acknowledgement result = {
            body: { message: "Event notified with content: '" + event.content.toString() + "'." }
        };
        return result;
    }

    isolated remote function onSubscriptionVerification(websub:SubscriptionVerification msg) returns websub:SubscriptionVerificationSuccess {
        log:printInfo("Subscription verification success. Hub mode: '" + msg.hubMode + "', hub topic: '" +
                       msg.hubTopic + "', hub challenge: '" + msg.hubChallenge + "'.");
        websub:SubscriptionVerificationSuccess result = {
            body: { message: "Subscription verification success. Hub mode: '" + msg.hubMode + "', hub topic: '" + msg.hubTopic +
                              "', hub challenge: '" + msg.hubChallenge + "'." }
        };
        return result;
    }
}
