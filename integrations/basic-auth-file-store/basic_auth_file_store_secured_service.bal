import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener listenerEP = new (9090,
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
                fileUserStoreConfig: {},
                scopes: ["view-order"]
            }
        ]
	}
    resource function get view() returns json|error {
        return {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
    }

    @http:ResourceConfig {
        auth: [
	        {
                fileUserStoreConfig: {},
                scopes: ["add-order"]
            }
        ]
    }
    resource function get add() returns json|error {
        return {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
    }
}
