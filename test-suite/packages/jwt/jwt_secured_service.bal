import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener jwtListenerEP = new(9090, config = {
    secureSocket: {
        keyStore: {
            path: "resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

listener http:Listener jwkListenerEP = new(9091, config = {
    secureSocket: {
        keyStore: {
            path: "resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

service /orders on jwtListenerEP, jwkListenerEP {

    @http:ResourceConfig {
	    auth: [
	        {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    trustStoreConfig: {
                        certificateAlias: "wso2carbon",
                        trustStore: {
                            path: "resources/wso2Truststore.p12",
                            password: "wso2carbon"
                        }
                    }
                },
                scopes: ["view-order"]
            },
            {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    jwksConfig: {
                        url: "https://localhost:9443/oauth2/jwks",
                        clientConfig: {
                            secureSocket: {
                                trustStore: {
                                    path: "resources/ballerinaTruststore.p12",
                                    password: "ballerina"
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
                    trustStoreConfig: {
                        certificateAlias: "wso2carbon",
                        trustStore: {
                            path: "resources/wso2Truststore.p12",
                            password: "wso2carbon"
                        }
                    }
                },
                scopes: ["add-order"]
            },
            {
                jwtValidatorConfig: {
                    issuer: "wso2is",
                    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
                    jwksConfig: {
                        url: "https://localhost:9443/oauth2/jwks",
                        clientConfig: {
                            secureSocket: {
                                trustStore: {
                                    path: "resources/ballerinaTruststore.p12",
                                    password: "ballerina"
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
