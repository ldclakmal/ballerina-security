import ballerina/http;
import ballerina/stringutils;

const string INVALID_REQUEST = "invalid_request";

string[] accessTokenStore = ["eyJhbGciOiJSUzI1NiIsICJ0eXAiOiJKV1QifQ"];

// The mock OAuth2 server, which is capable of issuing access tokens with related to the grant type and also of refreshing the
// already-issued access tokens. This keeps the set of issued access tokens for the validation purpose of the API  endpoint.
listener http:Listener oauth2Server = new(9191, {
    secureSocket: {
        keyStore: {
            path: "${ballerina.home}/bre/security/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

service oauth2 on oauth2Server {

    @http:ResourceConfig {
        methods: ["POST"],
        path: "/token/introspect"
    }
    // This introspect the access token against the access token store, which holds the issued access tokens.
    resource function introspect(http:Caller caller, http:Request req) {
        http:Response res = getResponseForIntrospectRequest(req);
        checkpanic caller->respond(res);
    }
}

function getResponseForIntrospectRequest(http:Request req) returns http:Response {
    http:Response res = new;
    var payload = req.getTextPayload();
    if (payload is string) {
        string[] params = stringutils:split(payload, "&");
        string token = "";
        string tokenTypeHint = "";
        foreach string param in params {
            if (stringutils:contains(param, "token")) {
                token = stringutils:split(param, "=")[1];
            } else if (stringutils:contains(param, "token_type_hint")) {
                tokenTypeHint = stringutils:split(param, "=")[1];
            }
        }

        boolean tokenAvailable = false;
        foreach string accessToken in accessTokenStore {
            if (accessToken == token) {
                tokenAvailable = true;
            }
        }
        if (tokenAvailable) {
            json responsePayload = { "active": true };
            res.setPayload(responsePayload);
        } else {
            json responsePayload = { "active": false };
            res.setPayload(responsePayload);
        }
    } else {
        // Invalid request. (Refer: https://tools.ietf.org/html/rfc6749#section-5.2)
        res.statusCode = http:STATUS_BAD_REQUEST;
        res.setPayload(INVALID_REQUEST);
    }
    return res;
}
