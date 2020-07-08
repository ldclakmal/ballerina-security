import ballerina/http;
import ballerina/jwt;
import ballerina/math;
import ballerina/system;

jwt:InboundJwtAuthProvider jwtAuthProvider = new({
    issuer: "wso2is",
    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
    trustStoreConfig: {
        certificateAlias: "wso2carbon",
        trustStore: {
            path: "src/resources/wso2-truststore.p12",
            password: "wso2carbon"
        }
    }
});
http:BearerAuthHandler jwtAuthHandler = new(jwtAuthProvider);

listener http:Listener jwtListenerEP = new(9090, config = {
    auth: {
        authHandlers: [jwtAuthHandler]
    },
    secureSocket: {
        keyStore: {
            path: "src/resources/ballerina-keystore.p12",
            password: "ballerina"
        }
    }
});

jwt:InboundJwtAuthProvider jwkAuthProvider = new({
    issuer: "wso2is",
    audience: "3VTwFk7u1i366wzmvpJ_LZlfAV4a",
    jwksConfig: {
        url: "https://localhost:9443/oauth2/jwks",
        clientConfig: {
            secureSocket: {
                trustStore: {
                    path: "src/resources/ballerina-truststore.p12",
                    password: "ballerina"
                }
            }
        }
    }
});
http:BearerAuthHandler jwkAuthHandler = new(jwkAuthProvider);

listener http:Listener jwkListenerEP = new(9091, config = {
    auth: {
        authHandlers: [jwkAuthHandler]
    },
    secureSocket: {
        keyStore: {
            path: "src/resources/ballerina-keystore.p12",
            password: "ballerina"
        }
    }
});

@http:ServiceConfig {
	basePath: "/orders"
}
service processOrder on jwtListenerEP, jwkListenerEP {

    @http:ResourceConfig {
	    path: "/view",
	    auth: {
            scopes: ["view-order"]
        }
	}
    resource function viewOrders(http:Caller caller, http:Request req) {
        json inventory = {
            "items": [
                {
                    "code": system:uuid(),
                    "qty" : <int>math:randomInRange(1, 100)
                }
            ]
        };
        checkpanic caller->respond(inventory);
    }

    @http:ResourceConfig {
        path: "/add",
        auth: {
            scopes: ["add-order"]
        }
    }
    resource function addOrder(http:Caller caller, http:Request req) {
        json inventory = {
            "items": [
                {
                    "code": system:uuid(),
                    "qty" : <int>math:randomInRange(1, 100)
                }
            ]
        };
        checkpanic caller->respond(inventory);
    }
}
