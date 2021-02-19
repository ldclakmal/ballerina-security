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
                fileUserStoreConfig: {
                    tableName: "b7a.users",
                    scopeKey: "scopes"
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
                fileUserStoreConfig: {
                    tableName: "b7a.users",
                    scopeKey: "scopes"
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
