import ballerina/http;
import ballerina/jwt;
import ballerina/test;

jwt:OutboundJwtAuthProvider outboundJwtAuthProvider = new({
    username: "wso2is",
    issuer: "wso2is",
    audience: ["3VTwFk7u1i366wzmvpJ_LZlfAV4a"],
    customClaims: {"scope": "view-order"},
    keyStoreConfig: {
        keyAlias: "wso2carbon",
        keyPassword: "wso2carbon",
        keyStore: {
            path: "src/resources/wso2-keystore.p12",
            password: "wso2carbon"
        }
    }
});
http:BearerAuthHandler outboundJwtAuthHandler = new(outboundJwtAuthProvider);

http:Client clientEP = new("https://localhost:9090", {
    auth: {
        authHandler: outboundJwtAuthHandler
    },
    secureSocket: {
        trustStore: {
            path: "src/resources/ballerina-truststore.p12",
            password: "ballerina"
        }
    }
});

@test:Config {}
public function testJwtAuthSuccess() {
    var response = clientEP->get("/orders/view");
    if (response is http:Response) {
        var result = response.getJsonPayload();
        test:assertTrue(result is json);
    } else {
        test:assertFail("Failed to call the endpoint.");
    }
}
