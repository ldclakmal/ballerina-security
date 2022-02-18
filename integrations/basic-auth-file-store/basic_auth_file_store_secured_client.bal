import ballerina/http;

final http:Client clientEP = check new ("https://localhost:9090",
    auth = {
        username: "bob",
        password: "bob@123"
    },
    secureSocket = {
        cert: "./resources/ballerinaPublic.crt"
    }
);

listener http:Listener apiEP = new (8080,
    secureSocket = {
        key: {
            certFile: "./resources/ballerinaPublic.crt",
            keyFile: "./resources/ballerinaPrivate.key"
        }
    }
);

isolated service /api on apiEP {
    isolated resource function get [string api]() returns json|error {
        json payload = check clientEP->get("/orders/" + api);
        return payload;
    }
}
