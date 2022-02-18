import ballerina/io;
import ballerina/websocket;

final websocket:Client wsClient = check new ("wss://localhost:9090/foo/bar",
    auth = {
        username: "ballerina",
        issuer: "wso2",
        audience: ["ballerina", "ballerina.org", "ballerina.io"],
        keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
        jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
        customClaims: { "scp": "admin" },
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
    _ = check wsClient->writeTextMessage("Hello, World!");
    string response = check wsClient->readTextMessage();
    io:println(response);
}
