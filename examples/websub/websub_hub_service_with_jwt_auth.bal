import ballerina/http;
import ballerina/jwt;
import ballerina/log;
import ballerina/websubhub;

listener websubhub:Listener securedHub = new(9090, config = {
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

service /websubhub on securedHub {
    remote function onRegisterTopic(websubhub:TopicRegistration msg, http:Request req) returns websubhub:TopicRegistrationSuccess|websubhub:TopicRegistrationError {
        string? auth = doAuth(req);
        if (auth is string) {
            return error websubhub:TopicRegistrationError(auth);
        }
        log:printInfo("Topic '" + msg.topic + "'registered.");
        websubhub:TopicRegistrationSuccess result = {
            body: "Topic '" + msg.topic + "'registered."
        };
        return result;
    }

    remote function onSubscription(websubhub:Subscription msg, http:Request req) returns websubhub:SubscriptionAccepted|websubhub:InternalSubscriptionError {
        string? auth = doAuth(req);
        if (auth is string) {
            return error websubhub:InternalSubscriptionError(auth);
        }
        log:printInfo("Subscription accepted for topic: '" + msg.hubTopic + "'.");
        websubhub:SubscriptionAccepted result = {
            body: "Subscription accepted for topic: '" + msg.hubTopic + "'."
        };
        return result;
    }

    remote function onUpdateMessage(websubhub:UpdateMessage msg, http:Request req) returns websubhub:Acknowledgement|websubhub:UpdateMessageError {
        string? auth = doAuth(req);
        if (auth is string) {
            return error websubhub:UpdateMessageError(auth);
        }
        log:printInfo("Message updated for message type: '" + msg.msgType.toString() + "', topic: '" + msg.hubTopic + "'.");
        websubhub:SubscriptionAccepted result = {
            body: "Message updated for message type: '" + msg.msgType.toString() + "', topic: '" + msg.hubTopic + "'."
        };
        return result;
    }
}

function doAuth(http:Request req) returns string? {
    jwt:Payload|http:Unauthorized authn = handler.authenticate(req);
    if (authn is http:Unauthorized) {
        string errorMsg = "Failed to authenticate the request. " + <string>authn?.body;
        log:printError(errorMsg);
        return errorMsg;
    }
    http:Forbidden? authz = handler.authorize(<jwt:Payload>authn, "hello");
    if (authz is http:Forbidden) {
        string errorMsg = "Failed to authorize the request for the scope key: 'scp' and value: 'hello'.";
        log:printError(errorMsg);
        return errorMsg;
    }
    return;
}
