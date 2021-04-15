import ballerina/http;

http:Client clientEP = checkpanic new("https://localhost:9090", {
    auth: {
        username: "ballerina",
        issuer: "wso2is",
        audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
        customClaims: {"scope": "view-order"},
        signatureConfig: {
            config: {
                keyAlias: "wso2carbon",
                keyPassword: "wso2carbon",
                keyStore: {
                    path: "resources/wso2Keystore.p12",
                    password: "wso2carbon"
                }
            }
        }
    },
    secureSocket: {
        cert: {
            path: "resources/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});

listener http:Listener apiEP = new(8080, {
    secureSocket: {
        key: {
            path: "resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

service /api on apiEP {
    resource function get [int id]/[string api]() returns http:Response|http:InternalServerError {
        var response = clientEP->get("/orders" + id.toString() + "/" + api);
        if (response is http:Response) {
            return response;
        } else {
            http:InternalServerError err = { body: response.toString() };
            return err;
        }
    }
}
