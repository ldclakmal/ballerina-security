import ballerina/websocket;

listener websocket:Listener securedEP = new(9090,
   secureSocket = {
       key: {
           certFile: "./resources/public.crt",
           keyFile: "./resources/private.key"
       }
   }
);

@websocket:ServiceConfig {
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
    resource function get bar() returns websocket:Service {
        return new WsService();
    }
}

service class WsService {
    *websocket:Service;
    remote function onTextMessage(websocket:Caller caller, string text) returns websocket:Error? {
        _ = check caller->writeTextMessage(text);
    }
}
