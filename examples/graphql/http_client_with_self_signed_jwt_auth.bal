import ballerina/http;
import ballerina/log;

http:Client securedEP = check new("https://localhost:9090",
    auth = {
        username: "ballerina",
        issuer: "wso2",
        audience: ["ballerina", "ballerina.org", "ballerina.io"],
        keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
        jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
        customClaims: { "sdcp": "hello" },
        expTime: 3600,
        signatureConfig: {
            config: {
                keyFile: "./resources/private.key"
            }
        }
    },
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

public function main() returns error? {
    json payload = { "query": "{ bar }" };
    http:Response response = check securedEP->post("/foo", payload, "application/json");
    log:printInfo((check response.getJsonPayload()).toString());
    log:printInfo(response.statusCode.toString());
}
