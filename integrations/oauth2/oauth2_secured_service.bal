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

service /orders on listenerEP {

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
                            cert: "./resources/wso2Public.crt"
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
