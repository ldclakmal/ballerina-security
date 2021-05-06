import ballerina/http;
import ballerina/log;

http:Client securedEP = check new("https://localhost:9090",
    auth = {
        refreshUrl: "https://localhost:9090/oauth2/token/refresh",
        refreshToken: "tGzv3JOkF0XG5Qx2TlKWIA",
        clientId: "s6BhdRkqt3",
        clientSecret: "7Fjfp0ZBr1KtDRbnfVdmIw",
        scopes: ["hello"],
        clientConfig: {
            secureSocket: {
                cert: "../resources/public.crt"
            }
        }
    },
    secureSocket = {
        cert: "../resources/public.crt"
    }
);

public function main() returns error? {
    http:Response response = check securedEP->get("/foo/bar");
    log:printInfo(response.statusCode.toString());
}
