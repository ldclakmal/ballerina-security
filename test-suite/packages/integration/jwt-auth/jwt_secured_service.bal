import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener jwtListenerEP = new(9090,
    secureSocket = {
        key: {
            path: "resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
);

// Signature is validated with truststore.
service /orders1 on jwtListenerEP {

    @http:ResourceConfig {
	    auth: [
	        {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    signatureConfig: {
                        trustStoreConfig: {
                            certAlias: "wso2carbon",
                            trustStore: {
                                path: "resources/wso2Truststore.p12",
                                password: "wso2carbon"
                            }
                        }
                    }
                },
                scopes: ["view-order"]
            }
        ]
	}
    resource function get view() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }

    @http:ResourceConfig {
        auth: [
            {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    signatureConfig: {
                        trustStoreConfig: {
                            certAlias: "wso2carbon",
                            trustStore: {
                                path: "resources/wso2Truststore.p12",
                                password: "wso2carbon"
                            }
                        }
                    }
                },
                scopes: ["add-order"]
            }
        ]
    }
    resource function get add() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }
}

// Signature is validated with public cert file.
service /orders2 on jwtListenerEP {

    @http:ResourceConfig {
	    auth: [
            {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    signatureConfig: {
                        certFile: "resources/wso2Public.crt"
                    }
                },
                scopes: ["view-order"]
            }
        ]
	}
    resource function get view() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }

    @http:ResourceConfig {
        auth: [
            {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    signatureConfig: {
                        certFile: "resources/wso2Public.crt"
                    }
                },
                scopes: ["add-order"]
            }
        ]
    }
    resource function get add() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }
}

// Signature is validated with JWKS endpoint.
service /orders3 on jwtListenerEP {

    @http:ResourceConfig {
	    auth: [
            {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    signatureConfig: {
                        jwksConfig: {
                            url: "https://localhost:9443/oauth2/jwks",
                            clientConfig: {
                                secureSocket: {
                                    cert: {
                                        path: "resources/ballerinaTruststore.p12",
                                        password: "ballerina"
                                    }
                                }
                            }
                        }
                    }
                },
                scopes: ["view-order"]
            }
        ]
	}
    resource function get view() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }

    @http:ResourceConfig {
        auth: [
            {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    signatureConfig: {
                        jwksConfig: {
                            url: "https://localhost:9443/oauth2/jwks",
                            clientConfig: {
                                secureSocket: {
                                    cert: {
                                        path: "resources/ballerinaTruststore.p12",
                                        password: "ballerina"
                                    }
                                }
                            }
                        }
                    }
                },
                scopes: ["add-order"]
            }
        ]
    }
    resource function get add() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }
}
