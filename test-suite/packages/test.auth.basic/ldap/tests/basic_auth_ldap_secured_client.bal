import ballerina/http;
import ballerina/test;

http:Client clientEP = checkpanic new("https://localhost:9090", {
    auth: {
        username: "alice",
        password: "alice123"
    },
    secureSocket: {
        cert: {
            path: "resources/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});

@test:Config {}
public function testBasicAuthLdapSuccess() {
    var response = clientEP->get("/orders/view");
    if (response is http:Response) {
        var result = response.getJsonPayload();
        test:assertTrue(result is json);
    } else {
        test:assertFail("Failed to call the endpoint.");
    }
}
