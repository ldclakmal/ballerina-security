import ballerina/http;

http:Client clientEP = checkpanic new("https://localhost:9090",
    auth = {
        username: "alice",
        password: "alice123"
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
