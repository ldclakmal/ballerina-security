import ballerina/http;
import ballerina/regex;
import ballerina/uuid;

listener http:Listener identityserver = new(9090, {
    secureSocket: {
        key: {
            certFile: "./cert/public.crt",
            keyFile: "./cert/private.key"
        }
    }
});

service /oauth2 on identityserver {
    resource function post token() returns json {
        json response = {
            "access_token": uuid:createType4AsString(),
            "refresh_token": uuid:createType4AsString(),
            "token_type": "example",
            "expires_in": 2,
            "scope": "example_scope",
            "example_parameter": "example_value"
        };
        return response;
    }

    resource function post token/refresh() returns json {
        json response = {
            "access_token": uuid:createType4AsString(),
            "refresh_token": uuid:createType4AsString(),
            "token_type": "example",
            "expires_in": 2,
            "scope": "example_scope",
            "example_parameter": "example_value"
        };
        return response;
    }

    resource function post token/introspect(http:Request request) returns json {
        string|http:ClientError payload = request.getTextPayload();
        if (payload is string) {
            string[] parts = regex:split(payload, "&");
            foreach string part in parts {
                if (part.indexOf("token=") is int) {
                    string token = regex:split(part, "=")[1];
                    if (uuid:validate(token)) {
                        json response = {
                            "active": true,
                            "scope": "read write dolphin",
                            "client_id": "l238j323ds-23ij4",
                            "username": "jdoe",
                            "token_type": "token_type",
                            "exp": 2,
                            "iat": 1419350238,
                            "nbf": 1419350238,
                            "sub": "Z5O3upPC88QrAjx00dis",
                            "aud": "https://protected.example.net/resource",
                            "iss": "https://server.example.com/",
                            "jti": "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
                            "extension_field": "twenty-seven"
                        };
                        return response;
                    } else {
                        json response = { "active": false };
                        return response;
                    }
                }
            }
        }
    }
}
