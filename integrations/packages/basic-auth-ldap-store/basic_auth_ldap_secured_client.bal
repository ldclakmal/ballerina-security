import ballerina/http;

http:Client clientEP = checkpanic new("https://localhost:9090",
    auth = {
        username: "alice",
        password: "alice@123"
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
