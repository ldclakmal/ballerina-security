import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener listenerEP = new(9090, {
    secureSocket: {
        keyStore: {
            path: "resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

service /orders on listenerEP {

    @http:ResourceConfig {
	    auth: [
	        {
                oauth2IntrospectionConfig: {
                    url: "https://localhost:9443/oauth2/introspect",
                    clientConfig: {
                        customHeaders: {"Authorization": "Basic YWRtaW46YWRtaW4="},
                        secureSocket: {
                            trustStore: {
                                path: "resources/ballerinaTruststore.p12",
                                password: "ballerina"
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
                oauth2IntrospectionConfig: {
                    url: "https://localhost:9443/oauth2/introspect",
                    clientConfig: {
                        customHeaders: {"Authorization": "Basic YWRtaW46YWRtaW4="},
                        secureSocket: {
                            trustStore: {
                                path: "resources/ballerinaTruststore.p12",
                                password: "ballerina"
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
