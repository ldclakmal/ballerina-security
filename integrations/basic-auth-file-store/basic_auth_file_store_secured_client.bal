import ballerina/http;

final http:Client clientEP = check new("https://localhost:9090",
    auth = {
        username: "bob",
        password: "bob@123"
    },
    secureSocket = {
        cert: "./resources/ballerinaPublic.crt"
    }
);

listener http:Listener apiEP = new(8080,
    secureSocket = {
        key: {
            certFile: "./resources/ballerinaPublic.crt",
            keyFile: "./resources/ballerinaPrivate.key"
        }
    }
);

isolated service /api on apiEP {
    isolated resource function get [string api]() returns http:Response|http:InternalServerError {
        http:Response|http:ClientError response = clientEP->get("/orders/" + api);
        if (response is http:Response) {
            return response;
        } else {
            http:InternalServerError err = { body: response.toString() };
            return err;
        }
    }
}
