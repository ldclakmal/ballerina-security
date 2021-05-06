import ballerina/http;
import ballerina/regex;
import ballerina/uuid;

// Default values of mock authorization server.
const int SERVER_PORT = 9090;
const int TOKEN_VALIDITY_PERIOD = 2;

// Values that the grant_type parameter can hold.
const GRANT_TYPE_CLIENT_CREDENTIALS = "client_credentials";
const GRANT_TYPE_PASSWORD = "password";
const GRANT_TYPE_REFRESH_TOKEN = "refresh_token";

// Credentials of the mock authorization server.
const string USERNAME = "admin";
const string PASSWORD = "admin";
const string CLIENT_ID = "FlfJYKBD2c925h4lkycqNZlC2l4a";
const string CLIENT_SECRET = "PJz0UhTJMrHOo68QQNpvnqAY_3Aa";

// Error responses. (Refer: https://tools.ietf.org/html/rfc6749#section-5.2)
final readonly & http:Unauthorized INVALID_CLIENT = {
    body: "invalid_client"
};
final readonly & http:Unauthorized UNAUTHORIZED_CLIENT = {
    body: "unauthorized_client"
};
final readonly & http:BadRequest INVALID_REQUEST = {
    body: "invalid_request"
};
final readonly & http:BadRequest INVALID_GRANT = {
    body: "invalid_grant"
};

string[] accessTokenStore = ["56ede317-4511-44b4-8579-a08f094ee8c5"];
string[] refreshTokenStore = ["24f19603-8565-4b5f-a036-88a945e1f272"];

// The mock authorization server, which is capable of issuing access-tokens with related to the grant type and
// also of refreshing the already-issued access-tokens. Also, capable of introspection the access-tokens.
listener http:Listener sts = new(SERVER_PORT, {
    secureSocket: {
        key: {
            certFile: "./cert/public.crt",
            keyFile: "./cert/private.key"
        }
    }
});

service /oauth2 on sts {

    // This issues an access token with reference to the received grant type.
    resource function post token(http:Request req) returns json|http:Unauthorized|http:BadRequest {
        var authorizationHeader = req.getHeader("Authorization");
        if (authorizationHeader is string) {
            if (isAuthorizedClient(authorizationHeader)) {
                var payload = req.getTextPayload();
                if (payload is string) {
                    string[] params = regex:split(payload, "&");
                    string grantType = "";
                    string scopes = "";
                    string username = "";
                    string password = "";
                    foreach string param in params {
                        if (param.includes("grant_type=")) {
                            grantType = regex:split(param, "=")[1];
                        } else if (param.includes("scope=")) {
                            scopes = regex:split(param, "=")[1];
                        } else if (param.includes("username=")) {
                            username = regex:split(param, "=")[1];
                        } else if (param.includes("password=")) {
                            password = regex:split(param, "=")[1];
                        }
                    }
                    return prepareTokenResponse(grantType, username, password);
                }
                return INVALID_REQUEST;
            }
            return INVALID_CLIENT;
        } else {
            var payload = req.getTextPayload();
            if (payload is string) {
                if (payload.includes("client_id") && payload.includes("client_secret")) {
                    string[] params = regex:split(payload, "&");
                    string grantType = "";
                    string scopes = "";
                    string username = "";
                    string password = "";
                    string clientId = "";
                    string clientSecret = "";
                    foreach string param in params {
                        if (param.includes("grant_type=")) {
                            grantType = regex:split(param, "=")[1];
                        } else if (param.includes("scope=")) {
                            scopes = regex:split(param, "=")[1];
                        } else if (param.includes("username=")) {
                            username = regex:split(param, "=")[1];
                        } else if (param.includes("password=")) {
                            password = regex:split(param, "=")[1];
                        } else if (param.includes("client_id=")) {
                            clientId = regex:split(param, "=")[1];
                        } else if (param.includes("client_secret=")) {
                            clientSecret = regex:split(param, "=")[1];
                        }
                    }
                    if (clientId == CLIENT_ID && clientSecret == CLIENT_SECRET) {
                        return prepareTokenResponse(grantType, username, password);
                    }
                    return INVALID_CLIENT;
                }
                return INVALID_CLIENT;
            }
            return INVALID_REQUEST;
        }
    }

    // This refreshes the access token but does not issue a new refresh token.
    resource function post token/refresh(http:Request req) returns json|http:Unauthorized|http:BadRequest {
        var authorizationHeader = req.getHeader("Authorization");
        if (authorizationHeader is string) {
            if (isAuthorizedClient(authorizationHeader)) {
                var payload = req.getTextPayload();
                if (payload is string) {
                    string[] params = regex:split(payload, "&");
                    string grantType = "";
                    string refreshToken = "";
                    string scopes = "";
                    foreach string param in params {
                        if (param.includes("grant_type=")) {
                            grantType = regex:split(param, "=")[1];
                        } else if (param.includes("refresh_token=")) {
                            refreshToken = regex:split(param, "=")[1];
                            // If the refresh token contains the `=` symbol, then it is required to concatenate all the parts of the value since
                            // the `split` function breaks all those into separate parts.
                            if (param.endsWith("==")) {
                                refreshToken += "==";
                            }
                        } else if (param.includes("scope=")) {
                            scopes = regex:split(param, "=")[1];
                        }
                    }
                    return prepareRefreshResponse(grantType, refreshToken);
                }
                return INVALID_REQUEST;
            }
            return INVALID_CLIENT;
        } else {
            var payload = req.getTextPayload();
            if (payload is string) {
                if (payload.includes("client_id") && payload.includes("client_secret")) {
                    string[] params = regex:split(payload, "&");
                    string grantType = "";
                    string refreshToken = "";
                    string scopes = "";
                    string clientId = "";
                    string clientSecret = "";
                    foreach string param in params {
                        if (param.includes("grant_type=")) {
                            grantType = regex:split(param, "=")[1];
                        } else if (param.includes("refresh_token=")) {
                            refreshToken = regex:split(param, "=")[1];
                            // If the refresh token contains the `=` symbol, then it is required to concatenate all the parts of the value since
                            // the `split` function breaks all those into separate parts.
                            if (param.endsWith("==")) {
                                refreshToken += "==";
                            }
                        } else if (param.includes("scope=")) {
                            scopes = regex:split(param, "=")[1];
                        } else if (param.includes("client_id=")) {
                            clientId = regex:split(param, "=")[1];
                        } else if (param.includes("client_secret=")) {
                            clientSecret = regex:split(param, "=")[1];
                        }
                    }
                    if (clientId == CLIENT_ID && clientSecret == CLIENT_SECRET) {
                        return prepareRefreshResponse(grantType, refreshToken);
                    }
                    return INVALID_CLIENT;
                }
                return INVALID_CLIENT;
            }
            return INVALID_REQUEST;
        }
    }

    resource function post token/introspect(http:Request req) returns json|http:Unauthorized|http:BadRequest {
        var authorizationHeader = req.getHeader("Authorization");
        if (authorizationHeader is string && isAuthorizedClient(authorizationHeader)) {
            var payload = req.getTextPayload();
            if (payload is string) {
                string[] params = regex:split(payload, "&");
                string token = "";
                string tokenTypeHint = "";
                foreach string param in params {
                    if (param.includes("token=")) {
                        token = regex:split(param, "=")[1];
                    } else if (param.includes("token_type_hint=")) {
                        tokenTypeHint = regex:split(param, "=")[1];
                    }
                }
                return prepareIntrospectionResponse(token, tokenTypeHint);
            }
            return INVALID_REQUEST;
        }
        return INVALID_CLIENT;
    }

    // This JWKs endpoint respond with a JSON object that represents a set of JWKs.
    // https://tools.ietf.org/html/rfc7517#section-5
    resource function get jwks() returns json {
        json jwks = {
          "keys": [
            {
              "kty": "RSA",
              "e": "AQAB",
              "use": "sig",
              "kid": "NTAxZmMxNDMyZDg3MTU1ZGM0MzEzODJhZWI4NDNlZDU1OGFkNjFiMQ",
              "alg": "RS256",
              "n": "AIFcoun1YlS4mShJ8OfcczYtZXGIes_XWZ7oPhfYCqhSIJnXD3vqrUu4GXNY2E41jAm8dd7BS5GajR3g1GnaZrSqN0w3bjpdbKjOnM98l2-i9-JP5XoedJsyDzZmml8Xd7zkKCuDqZIDtZ99poevrZKd7Gx5n2Kg0K5FStbZmDbTyX30gi0_griIZyVCXKOzdLp2sfskmTeu_wF_vrCaagIQCGSc60Yurnjd0RQiMWA10jL8axJjnZ-IDgtKNQK_buQafTedrKqhmzdceozSot231I9dth7uXvmPSjpn23IYUIpdj_NXCIt9FSoMg5-Q3lhLg6GK3nZOPuqgGa8TMPs="
            }
          ]
        };
        return jwks;
    }
}

function prepareTokenResponse(string grantType, string username, string password) returns json|http:Unauthorized|http:BadRequest {
    if (grantType == GRANT_TYPE_CLIENT_CREDENTIALS) {
        string accessToken = uuid:createType4AsString();
        addToAccessTokenStore(accessToken);
        json response = {
            "access_token": accessToken,
            "token_type": "example",
            "expires_in": TOKEN_VALIDITY_PERIOD,
            "scope": "read write dolphin",
            "example_parameter": "example_value"
        };
        return response;
    } else if (grantType == GRANT_TYPE_PASSWORD) {
        if (username == USERNAME && password == PASSWORD) {
            string accessToken = uuid:createType4AsString();
            addToAccessTokenStore(accessToken);
            string refreshToken = uuid:createType4AsString();
            addToRefreshTokenStore(refreshToken);
            json response = {
                "access_token": accessToken,
                "refresh_token": refreshToken,
                "token_type": "example",
                "expires_in": TOKEN_VALIDITY_PERIOD,
                "scope": "read write dolphin",
                "example_parameter": "example_value"
            };
            return response;
        }
        return UNAUTHORIZED_CLIENT;
    }
    return INVALID_GRANT;
}

function prepareRefreshResponse(string grantType, string refreshToken) returns json|http:BadRequest {
    if (grantType == GRANT_TYPE_REFRESH_TOKEN) {
        foreach string token in refreshTokenStore {
            if (token == refreshToken) {
                string accessToken = uuid:createType4AsString();
                addToAccessTokenStore(accessToken);
                string updatedRefreshToken = uuid:createType4AsString();
                addToRefreshTokenStore(updatedRefreshToken);
                json response = {
                    "access_token": accessToken,
                    "refresh_token": updatedRefreshToken,
                    "token_type": "example",
                    "expires_in": TOKEN_VALIDITY_PERIOD,
                    "scope": "read write dolphin",
                    "example_parameter": "example_value"
                };
                return response;
            }
        }
        return INVALID_GRANT;
    }
    return INVALID_GRANT;
}

function prepareIntrospectionResponse(string accessToken, string tokenTypeHint) returns json {
    foreach string token in accessTokenStore {
        if (token == accessToken) {
            json response = {
                "active": true,
                "scope": "read write dolphin",
                "client_id": "l238j323ds-23ij4",
                "username": "jdoe",
                "token_type": "token_type",
                "exp": TOKEN_VALIDITY_PERIOD,
                "iat": 1419350238,
                "nbf": 1419350238,
                "sub": "Z5O3upPC88QrAjx00dis",
                "aud": "https://protected.example.net/resource",
                "iss": "https://server.example.com/",
                "jti": "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
                "extension_field": "twenty-seven"
            };
            return response;
        }
    }
    json response = { "active": false };
    return response;
}

function isAuthorizedClient(string authorizationHeader) returns boolean {
    string clientIdSecret = CLIENT_ID + ":" + CLIENT_SECRET;
    string expectedAuthorizationHeader = "Basic " + clientIdSecret.toBytes().toBase64();
    return authorizationHeader == expectedAuthorizationHeader;
}

function addToAccessTokenStore(string accessToken) {
    int index = accessTokenStore.length();
    accessTokenStore[index] = accessToken;
}

function addToRefreshTokenStore(string refreshToken) {
    int index = refreshTokenStore.length();
    refreshTokenStore[index] = refreshToken;
}
