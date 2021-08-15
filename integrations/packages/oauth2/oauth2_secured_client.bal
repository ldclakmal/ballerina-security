import ballerina/http;

http:Client clientEP = checkpanic new("https://localhost:9090",
    auth = {
        tokenUrl: "https://localhost:9443/oauth2/token",
        clientId: "uDMwA4hKR9H3deeXxvNf4sSU0i4a",
        clientSecret: "8FOUOKUQfOp47pUfJCsPA5X4clga",
        scopes: ["view-order"],
        clientConfig: {
            secureSocket: {
                cert: "resources/wso2Public.crt"
            }
        }
    },
    secureSocket = {
        cert: "resources/ballerinaPublic.crt"
    }
);

listener http:Listener apiEP = new(8080,
    secureSocket = {
        key: {
            certFile: "resources/ballerinaPublic.crt",
            keyFile: "resources/ballerinaPrivate.key"
        }
    }
);

service /api on apiEP {
    resource function get [string api]() returns http:Response|http:InternalServerError {
        http:Response|http:ClientError response = clientEP->get("/orders/" + api);
        if (response is http:Response) {
            return response;
        } else {
            http:InternalServerError err = { body: response.toString() };
            return err;
        }
    }
}

