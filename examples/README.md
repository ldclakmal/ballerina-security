[![Examples](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml)

# Ballerina Security Examples

This section demonstrates the examples with authentication and authorization for different transport protocols supported by Ballerina. The client and servers are secured with different auth protocols.

1. [HTTP](#http)
2. [gRPC](#grpc)
3. [WebSocket](#websocket)
4. [WebSub](#websub)
5. [GraphQL](#graphql)

---

### HTTP

<details>
<summary>Server</summary>

```ballerina
import ballerina/http;

listener http:Listener securedEP = new(9090,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

@http:ServiceConfig {
    auth: [
        {
            jwtValidatorConfig: {
                issuer: "wso2",
                audience: "ballerina",
                signatureConfig: {
                    certFile: "./resources/public.crt"
                },
                scopeKey: "scp"
            },
            scopes: ["admin"]
        }
    ]
}
service /foo on securedEP {
    resource function get bar() returns string {
        return "Hello, World!";
    }
}
```

```shell
$ bal run server.bal
```
</details>

<details>
<summary>Client</summary>

```ballerina
import ballerina/http;
import ballerina/io;

http:Client securedEP = check new("https://localhost:9090",
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

public function main() returns error? {
    http:Response response = check securedEP->get("/foo/bar");
    io:println(check response.getTextPayload());
}
```

```shell
$ bal run client.bal
```
</details>

> [Source Code](https://github.com/ldclakmal/ballerina-security/tree/master/examples/packages/http)

---

### gRPC

<details>
<summary>Server</summary>

```ballerina
import ballerina/grpc;
import ballerina/jwt;

listener grpc:Listener securedEP = new(9090,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

grpc:ListenerJwtAuthHandler handler = new({
    issuer: "wso2",
    audience: "ballerina",
    signatureConfig: {
        certFile: "./resources/public.crt"
    },
    scopeKey: "scp"
});

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR,
    descMap: getDescriptorMap()
}
service "HelloWorld" on securedEP {
    remote function foo(ContextString request) returns string|grpc:UnauthenticatedError|grpc:PermissionDeniedError {
        jwt:Payload|grpc:UnauthenticatedError authn = handler.authenticate(request.headers);
        if (authn is grpc:UnauthenticatedError) {
            return authn;
        } else {
            grpc:PermissionDeniedError? authz = handler.authorize(authn, "admin");
            if (authz is grpc:PermissionDeniedError) {
                return authz;
            }
            return "Hello, World!";
        }
    }
}


// --- Generated Stub ---

public type ContextString record {|
    string content;
    map<string|string[]> headers;
|};

const string ROOT_DESCRIPTOR = "0A0A677270632E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F" +
                               "746F324F0A0A48656C6C6F576F726C6412410A03666F6F121C2E676F6F676C652E70726F746F6275662E" +
                               "537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756562" +
                               "0670726F746F33";
isolated function getDescriptorMap() returns map<string> {
    return {
        "grpc.proto":"0A0A677270632E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F324F0A" +
        "0A48656C6C6F576F726C6412410A03666F6F121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6" +
        "F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F" +
        "676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A4" +
        "66C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C75" +
        "65180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220" +
        "A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576" +
        "616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C7565222" +
        "30A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A05" +
        "76616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726" +
        "F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573" +
        "620670726F746F33"
    };
}
```

```shell
$ bal run server.bal
```
</details>

<details>
<summary>Client</summary>

```ballerina
import ballerina/grpc;
import ballerina/io;

HelloWorldClient ep = check new("https://localhost:9090",
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

public function main() returns error? {
    grpc:ClientSelfSignedJwtAuthHandler handler = new({
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
    });
    map<string|string[]> headers = {};
    headers = check handler.enrich(headers);
    ContextString requestMessage = { content: "Ballerina", headers: headers };
    ContextString result = check ep->fooContext(requestMessage);
    io:println(result.content);
}


// --- Generated Stub ---

public client class HelloWorldClient {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        // initialize client endpoint.
        self.grpcClient = check new(url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR, getDescriptorMap());
    }

    isolated remote function foo(string|ContextString req) returns (string|grpc:Error) {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("HelloWorld/foo", message, headers);
        [anydata, map<string|string[]>][result, _] = payload;
        return result.toString();
    }

    isolated remote function fooContext(string|ContextString req) returns (ContextString|grpc:Error) {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("HelloWorld/foo", message, headers);
        [anydata, map<string|string[]>][result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }
}

public type ContextString record {|
    string content;
    map<string|string[]> headers;
|};

const string ROOT_DESCRIPTOR = "0A0A677270632E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F" +
                               "746F324F0A0A48656C6C6F576F726C6412410A03666F6F121C2E676F6F676C652E70726F746F6275662E" +
                               "537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756562" +
                               "0670726F746F33";
isolated function getDescriptorMap() returns map<string> {
    return {
        "grpc.proto":"0A0A677270632E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F324F0A" +
        "0A48656C6C6F576F726C6412410A03666F6F121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6" +
        "F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F" +
        "676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A4" +
        "66C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C75" +
        "65180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220" +
        "A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576" +
        "616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C7565222" +
        "30A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A05" +
        "76616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726" +
        "F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573" +
        "620670726F746F33"
    };
}
```

```shell
$ bal run client.bal
```
</details>

> [Source Code](https://github.com/ldclakmal/ballerina-security/tree/master/examples/packages/grpc)

---

### WebSocket

<details>
<summary>Server</summary>

```ballerina
import ballerina/http;
import ballerina/jwt;
import ballerina/log;
import ballerina/websocket;

listener websocket:Listener securedEP = new(9090,
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

service /foo on securedEP {
    resource function get bar(http:Request req) returns websocket:Service|websocket:AuthError {
        jwt:Payload|http:Unauthorized authn = handler.authenticate(req);
        if (authn is http:Unauthorized) {
            string errorMsg = "Failed to authenticate the request. " + <string>authn?.body;
            log:printError(errorMsg);
            return error websocket:AuthError(errorMsg);
        }
        http:Forbidden? authz = handler.authorize(<jwt:Payload>authn, "admin");
        if (authz is http:Forbidden) {
            string errorMsg = "Failed to authorize the request for the scope key: 'scp' and value: 'hello'.";
            log:printError(errorMsg);
            return error websocket:AuthError(errorMsg);
        }
        return new WsService();
    }
}

service class WsService {
    *websocket:Service;
    remote function onTextMessage(websocket:Caller caller, string text) returns websocket:Error? {
        _ = check caller->writeTextMessage(text);
    }
}
```

```shell
$ bal run server.bal
```
</details>

<details>
<summary>Client</summary>

```ballerina
import ballerina/io;
import ballerina/websocket;

websocket:Client wsClient = check new("wss://localhost:9090/foo/bar",
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

public function main() returns error? {
    _ = check wsClient->writeTextMessage("Hello, World!");
    string response = check wsClient->readTextMessage();
    io:println(response);
}
```

```shell
$ bal run client.bal
```
</details>

> [Source Code](https://github.com/ldclakmal/ballerina-security/tree/master/examples/packages/websocket)

---

### WebSub

<details>
<summary>Hub</summary>

```ballerina
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
    http:Forbidden? authz = handler.authorize(<jwt:Payload>authn, "admin");
    if (authz is http:Forbidden) {
        string errorMsg = "Failed to authorize the request for the scope key: 'scp' and value: 'admin'.";
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
```

```shell
$ bal run hub.bal
```
</details>

<details>
<summary>Subscriber</summary>

```ballerina
import ballerina/log;
import ballerina/websub;

listener websub:Listener securedSubscriber = new(8080,
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
service /subscriber on securedSubscriber {
    remote function onEventNotification(websub:ContentDistributionMessage event) returns websub:Acknowledgement {
        log:printInfo("Event notified with content: '" + event.content.toString() + "'.");
        websub:Acknowledgement result = {
            body: { message: "Event notified with content: '" + event.content.toString() + "'." }
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
```

```shell
$ bal run subscriber.bal
```
</details>

<details>
<summary>Publisher</summary>

```ballerina
import ballerina/io;
import ballerina/log;
import ballerina/websubhub;

public function main() returns error? {
    websubhub:PublisherClient publsherClient = check new("https://localhost:9090/websubhub",
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

    websubhub:TopicRegistrationSuccess|websubhub:TopicRegistrationError registrationResponse = publsherClient->registerTopic("Ballerina");
    if (registrationResponse is websubhub:TopicRegistrationSuccess) {
        io:println("Topic registration successful.");
    } else {
        log:printError("Topic registration failed!.", 'error = registrationResponse);
    }

    string payload = "Swan Lake GA Released!";
    websubhub:Acknowledgement|websubhub:UpdateMessageError publishResponse = publsherClient->publishUpdate("Ballerina", payload);
    if (publishResponse is websubhub:Acknowledgement) {
        io:println("Publish update successful.");
    } else {
        log:printError("Publish update failed!.", 'error = publishResponse);
    }
}
```

```shell
$ bal run publisher.bal
```
</details>

> [Source Code](https://github.com/ldclakmal/ballerina-security/tree/master/examples/packages/websub)

---

### GraphQL

<details>
<summary>Server</summary>

```ballerina
import ballerina/graphql;

listener graphql:Listener securedEP = new(9090,
   secureSocket = {
       key: {
           certFile: "./resources/public.crt",
           keyFile: "./resources/private.key"
       }
   }
);

@graphql:ServiceConfiguration {
    auth: [
        {
            jwtValidatorConfig: {
                issuer: "wso2",
                audience: "ballerina",
                signatureConfig: {
                    certFile: "./resources/public.crt"
                },
                scopeKey: "scp"
            },
            scopes: ["admin"]
        }
    ]
}
service /foo on securedEP {
    resource function get bar() returns string {
        return "Hello, World!";
    }
}
```

```shell
$ bal run server.bal
```
</details>

<details>
<summary>Client</summary>

```ballerina
import ballerina/http;
import ballerina/io;

http:Client securedEP = check new("https://localhost:9090",
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

public function main() returns error? {
    json payload = { "query": "{ bar }" };
    http:Response response = check securedEP->post("/foo", payload, "application/json");
    io:println((check response.getJsonPayload()).toString());
}
```

```shell
$ bal run client.bal
```
</details>

> [Source Code](https://github.com/ldclakmal/ballerina-security/tree/master/examples/packages/graphql)
