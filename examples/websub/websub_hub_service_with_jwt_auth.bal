import ballerina/http;
import ballerina/jwt;
import ballerina/log;
import ballerina/websubhub;

listener websubhub:Listener securedHub = new(9090,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

http:ListenerJwtAuthHandler handler = new({
    issuer: "wso2",
    audience: "ballerina",
    signatureConfig: {
        certFile: "./resources/public.crt"
    },
    scopeKey: "scp"
});

@websubhub:ServiceConfig {
    webHookConfig: {
        secureSocket: {
            cert: "./resources/public.crt"
        }
    }
}
service /websubhub on securedHub {
    remote function onRegisterTopic(websubhub:TopicRegistration msg, http:Request req) returns websubhub:TopicRegistrationSuccess|websubhub:TopicRegistrationError {
        string? auth = doAuth(req);
        if (auth is string) {
            return error websubhub:TopicRegistrationError(auth);
        }
        log:printInfo("Registered topic: '" + msg.topic + "'.");
        websubhub:TopicRegistrationSuccess result = {
            body: "Registered topic: '" + msg.topic + "'."
        };
        return result;
    }

    remote function onDeregisterTopic(websubhub:TopicDeregistration msg, http:Request req) returns websubhub:TopicDeregistrationSuccess|websubhub:TopicDeregistrationError {
        string? auth = doAuth(req);
        if (auth is string) {
            return error websubhub:TopicDeregistrationError(auth);
        }
        log:printInfo("Deregistered topic: '" + msg.topic + "'.");
        websubhub:TopicDeregistrationSuccess result = {
            body: "Deregistered topic: '" + msg.topic + "'."
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

    // Internal call from Hub itself
    remote function onSubscriptionValidation(websubhub:Subscription msg) {
        log:printInfo("Subscription validated for topic: '" + msg.hubTopic + "'.");
    }

    // Internal call from Hub itself
    remote function onSubscriptionIntentVerified(websubhub:VerifiedSubscription msg) {
        log:printInfo("Subscription intent verified: '" + msg.verificationSuccess.toString() + "', for topic: '" + msg.hubTopic + "'.");
        addSubscriber(msg);
    }

    remote function onUnsubscriptionIntentVerified(websubhub:VerifiedUnsubscription msg) {
        log:printInfo("Unsubscription intent verified: '" + msg.verificationSuccess.toString() + "', for topic: '" + msg.hubTopic + "'.");
        removeSubscriber(msg);
    }

    remote function onUpdateMessage(websubhub:UpdateMessage msg, http:Request req) returns websubhub:Acknowledgement|websubhub:UpdateMessageError {
        string? auth = doAuth(req);
        if (auth is string) {
            return error websubhub:UpdateMessageError(auth);
        }
        log:printInfo("Message updated for message type: '" + msg.msgType.toString() + "', topic: '" + msg.hubTopic +
                        "', content-type: '" + msg.contentType + "', content: '" + msg.content.toString() + "'.");
        websubhub:Subscription[] subscribers = retrieveSubscribers(msg.hubTopic);
        foreach websubhub:Subscription sub in subscribers {
            log:printInfo("Subscriber found with callback URL: '" + sub.hubCallback + "'");
            websubhub:HubClient|error clientEP = new(sub, {
                secureSocket: {
                    cert: "./resources/public.crt"
                }
            });
            if (clientEP is error) {
                log:printError("Error occurred while initializing the hub client.", 'error = clientEP);
            } else {
                websubhub:ContentDistributionMessage distributionMsg = {
                    content: msg.content.toString()
                };
                websubhub:ContentDistributionSuccess|websubhub:SubscriptionDeletedError|error? response = clientEP->notifyContentDistribution(distributionMsg);
                if (response is websubhub:ContentDistributionSuccess) {
                    log:printInfo("Successfully notified the content to subscriber.");
                } else if (response is websubhub:SubscriptionDeletedError) {
                    log:printError("Subscription deleted error occurred while notifying the content to subscriber.");
                } else if (response is error) {
                    log:printError("Error occurred while notifying the content to subscriber.", 'error = response);
                }
            }
        }
        return websubhub:ACKNOWLEDGEMENT;
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

map<websubhub:Subscription[]> subscribersMap = {};

function addSubscriber(websubhub:Subscription subscriber) {
    if (subscribersMap.hasKey(subscriber.hubTopic)) {
        subscribersMap.get(subscriber.hubTopic).push(subscriber);
    } else {
        websubhub:Subscription[] subscribersArray = [];
        subscribersArray.push(subscriber);
        subscribersMap[subscriber.hubTopic] = subscribersArray;
    }
}

function removeSubscriber(websubhub:Unsubscription subscriber) {
    if (subscribersMap.hasKey(subscriber.hubTopic)) {
        websubhub:Subscription[] subscribersArray = subscribersMap.get(subscriber.hubTopic);
        int i = 0;
        foreach websubhub:Subscription sub in subscribersArray {
            if (sub.hubCallback == subscriber.hubCallback) {
                break;
            }
            i = i + 1;
        }
        _ = subscribersArray.remove(i);
        subscribersMap[subscriber.hubTopic] = subscribersArray;
    }
}

function isTopicAvailable(string topic) returns boolean {
    return subscribersMap.hasKey(topic);
}

function retrieveSubscribers(string topic) returns websubhub:Subscription[] {
    return subscribersMap.get(topic).clone();
}
