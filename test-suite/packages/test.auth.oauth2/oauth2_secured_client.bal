import ballerina/http;

http:Client clientEP = checkpanic new("https://localhost:9090",
    auth = {
        tokenUrl: "https://localhost:9443/oauth2/token",
        clientId: "FlfJYKBD2c925h4lkycqNZlC2l4a",
        clientSecret: "PJz0UhTJMrHOo68QQNpvnqAY_3Aa",
        scopes: ["view-order"],
        clientConfig: {
            secureSocket: {
                cert: {
                    path: "resources/wso2Truststore.p12",
                    password: "wso2carbon"
                }
            }
        }
    },
    secureSocket = {
        cert: {
            path: "resources/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
);

listener http:Listener apiEP = new(8080,
    secureSocket = {
        key: {
            path: "resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
);

service /api on apiEP {
    resource function get [string api]() returns http:Response|http:InternalServerError {
        var response = clientEP->get("/orders/" + api);
        if (response is http:Response) {
            return response;
        } else {
            http:InternalServerError err = { body: response.toString() };
            return err;
        }
    }
}

