import ballerina/http;
import ballerina/log;

http:Client securedEP = check new("https://localhost:9090", {
    auth: {
        token: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In"
    },
    secureSocket: {
        cert: "../resources/public.crt"
    }
});

public function main() returns error? {
    http:Response response = check securedEP->get("/foo/bar");
    log:printInfo(response.statusCode.toString());
}
