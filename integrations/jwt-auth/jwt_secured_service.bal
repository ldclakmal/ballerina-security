import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener jwtListenerEP = new(9090,
    secureSocket = {
        key: {
            certFile: "./resources/ballerinaPublic.crt",
            keyFile: "./resources/ballerinaPrivate.key"
        }
    }
);

// Signature is validated with truststore.
isolated service /orders1 on jwtListenerEP {

    @http:ResourceConfig {
	    auth: [
	        {
                jwtValidatorConfig: {
                    issuer: "https://localhost:9443/oauth2/token",
                    audience: "I8_BIl8BxpVj1SzZm6Q49y4jFuIa",
                    signatureConfig: {
                        certFile: "./resources/wso2Public.crt"
                    }
                },
                scopes: ["view-order"]
            }
        ]
	}
    isolated resource function get view() returns json|error {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }

    @http:ResourceConfig {
        auth: [
            {
                jwtValidatorConfig: {
                    issuer: "https://localhost:9443/oauth2/token",
                    audience: "I8_BIl8BxpVj1SzZm6Q49y4jFuIa",
                    signatureConfig: {
                        certFile: "./resources/wso2Public.crt"
                    }
                },
                scopes: ["add-order"]
            }
        ]
    }
    isolated resource function get add() returns json|error {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }
}

// Signature is validated with public cert file.
isolated service /orders2 on jwtListenerEP {

    @http:ResourceConfig {
	    auth: [
            {
                jwtValidatorConfig: {
                    issuer: "https://localhost:9443/oauth2/token",
                    audience: "I8_BIl8BxpVj1SzZm6Q49y4jFuIa",
                    signatureConfig: {
                        certFile: "./resources/wso2Public.crt"
                    }
                },
                scopes: ["view-order"]
            }
        ]
	}
    isolated resource function get view() returns json|error {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }

    @http:ResourceConfig {
        auth: [
            {
                jwtValidatorConfig: {
                    issuer: "https://localhost:9443/oauth2/token",
                    audience: "I8_BIl8BxpVj1SzZm6Q49y4jFuIa",
                    signatureConfig: {
                        certFile: "./resources/wso2Public.crt"
                    }
                },
                scopes: ["add-order"]
            }
        ]
    }
    isolated resource function get add() returns json|error {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }
}

// Signature is validated with JWKS endpoint.
isolated service /orders3 on jwtListenerEP {

    @http:ResourceConfig {
	    auth: [
            {
                jwtValidatorConfig: {
                    issuer: "https://localhost:9443/oauth2/token",
                    audience: "I8_BIl8BxpVj1SzZm6Q49y4jFuIa",
                    signatureConfig: {
                        jwksConfig: {
                            url: "https://localhost:9443/oauth2/jwks",
                            clientConfig: {
                                secureSocket: {
                                    cert: "./resources/wso2Public.crt"
                                }
                            }
                        }
                    }
                },
                scopes: ["view-order"]
            }
        ]
	}
    isolated resource function get view() returns json|error {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }

    @http:ResourceConfig {
        auth: [
            {
                jwtValidatorConfig: {
                    issuer: "https://localhost:9443/oauth2/token",
                    audience: "I8_BIl8BxpVj1SzZm6Q49y4jFuIa",
                    signatureConfig: {
                        jwksConfig: {
                            url: "https://localhost:9443/oauth2/jwks",
                            clientConfig: {
                                secureSocket: {
                                    cert: "./resources/wso2Public.crt"
                                }
                            }
                        }
                    }
                },
                scopes: ["add-order"]
            }
        ]
    }
    isolated resource function get add() returns json|error {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }
}
