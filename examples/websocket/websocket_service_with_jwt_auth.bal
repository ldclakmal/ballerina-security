import ballerina/http;
import ballerina/jwt;
import ballerina/log;
import ballerina/websocket;

listener websocket:Listener securedEP = new(9090,
   secureSocket = {
       key: {
           certFile: "../resources/public.crt",
           keyFile: "../resources/private.key"
       }
   }
);

http:ListenerJwtAuthHandler handler = new({
    issuer: "wso2",
    audience: "ballerina",
    signatureConfig: {
        certFile: "../resources/public.crt"
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
        http:Forbidden? authz = handler.authorize(<jwt:Payload>authn, "hello");
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
