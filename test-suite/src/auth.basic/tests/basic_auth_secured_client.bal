import ballerina/auth;
import ballerina/http;
import ballerina/test;

auth:OutboundBasicAuthProvider outboundBasicAuthProvider = new({
    username: "alice",
    password: "alice123"
});
http:BasicAuthHandler outboundBasicAuthHandler = new(outboundBasicAuthProvider);

http:Client clientEP = new("https://localhost:9090", {
    auth: {
        authHandler: outboundBasicAuthHandler
    },
    secureSocket: {
        trustStore: {
            path: "src/resources/ballerina-truststore.p12",
            password: "ballerina"
        }
    }
});

@test:Config {}
public function testBasicAuthSuccess() {
    var response = clientEP->get("/orders/view");
    if (response is http:Response) {
        var result = response.getJsonPayload();
        test:assertTrue(result is json);
    } else {
        test:assertFail("Failed to call the endpoint.");
    }
}
