import ballerina/http;
import ballerina/log;
import ballerina/websub;

listener websub:Listener securedSubscriber = new(8080, config = {
    secureSocket: {
        key: {
            certFile: "../resources/public.crt",
            keyFile: "../resources/private.key"
        }
    }
});


http:ListenerJwtAuthHandler handler = new({
    issuer: "wso2",
    audience: "ballerina",
    signatureConfig: {
        certFile: "../resources/public.crt"
    },
    scopeKey: "scp"
});

@websub:SubscriberServiceConfig {
    target: [
        "https://localhost:9090/websubhub", "Ballerina"
    ],
    secret: "b745e11a57e9",
    httpConfig: {
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
    }
}
service /subscriber on securedSubscriber {
    remote function onEventNotification(websub:ContentDistributionMessage event) returns websub:Acknowledgement {
        log:printInfo("Event notified. Content: '" + event.content.toString() + "'.");
        websub:Acknowledgement result = {
            body: { message: "Event notified. Content: '" + event.content.toString() + "'." }
        };
        return result;
    }

    remote function onSubscriptionVerification(websub:SubscriptionVerification msg) returns websub:SubscriptionVerificationSuccess {
        log:printInfo("Subscription verification success. Hub mode: '" + msg.hubMode + "', hub topic: '" +
                       msg.hubTopic + "', hub challenge: '" + msg.hubChallenge + "'.");
        websub:SubscriptionVerificationSuccess result = {
            body: { message: "Subscription verification success. Hub mode: '" + msg.hubMode + "', hub topic: '" + msg.hubTopic +
                              "', hub challenge: '" + msg.hubChallenge + "'." }
        };
        return result;
    }
}
