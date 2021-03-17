import ballerina/http;
import ballerina/test;

http:Client clientEP = checkpanic new("https://localhost:9090", {
    auth: {
        username: "wso2is",
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

@test:Config {}
public function testJwtAuthSuccess() {
    var response = clientEP->get("/orders1/view");
    if (response is http:Response) {
        var result = response.getJsonPayload();
        test:assertTrue(result is json);
    } else {
        test:assertFail("Failed to call the endpoint.");
    }
}
