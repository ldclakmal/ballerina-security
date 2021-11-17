import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener listenerEP = new(9090,
    secureSocket = {
        key: {
            certFile: "./resources/ballerinaPublic.crt",
            keyFile: "./resources/ballerinaPrivate.key"
        }
    }
);

isolated service /orders on listenerEP {

    @http:ResourceConfig {
	    auth: [
	        {
                oauth2IntrospectionConfig: {
                    url: "https://localhost:9443/oauth2/introspect",
                    clientConfig: {
                        customHeaders: {"Authorization": "Basic YWRtaW46YWRtaW4="},
                        secureSocket: {
                            cert: "./resources/wso2Public.crt"
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
                oauth2IntrospectionConfig: {
                    url: "https://localhost:9443/oauth2/introspect",
                    clientConfig: {
                        customHeaders: {"Authorization": "Basic YWRtaW46YWRtaW4="},
                        secureSocket: {
                            cert: "./resources/wso2Public.crt"
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
