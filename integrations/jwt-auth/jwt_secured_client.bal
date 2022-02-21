import ballerina/http;

final http:Client clientEP = check new ("https://localhost:9090",
    auth = {
        username: "ballerina",
        issuer: "https://localhost:9443/oauth2/token",
        audience: "I8_BIl8BxpVj1SzZm6Q49y4jFuIa",
        customClaims: {"scope": "view-order"},
        signatureConfig: {
            config: {
                keyFile: "./resources/wso2Private.key"
            }
        }
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
    isolated resource function get [int id]/[string api]() returns json|error {
        json payload = check clientEP->get("/orders" + id.toString() + "/" + api);
        return payload;
    }
}