import ballerina/http;
import ballerina/io;

http:Client securedEP = check new("https://localhost:9090",
    auth = {
        tokenUrl: "https://localhost:9445/oauth2/token",
        clientId: "FlfJYKBD2c925h4lkycqNZlC2l4a",
        clientSecret: "PJz0UhTJMrHOo68QQNpvnqAY_3Aa",
        scopes: ["admin"],
        clientConfig: {
            secureSocket: {
                cert: "./resources/public.crt"
            }
        }
    },
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

public function main() returns error? {
    string response = check securedEP->get("/foo/bar");
    io:println(response);
}
