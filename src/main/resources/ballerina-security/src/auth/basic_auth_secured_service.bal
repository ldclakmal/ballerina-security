import ballerina/auth;
import ballerina/http;
import ballerina/jwt;
import ballerina/log;

auth:InboundBasicAuthProvider inboundBasicAuthProvider = new;
http:BasicAuthHandler inboundBasicAuthHandler = new(inboundBasicAuthProvider);

listener http:Listener basicAuthSecuredListener = new(9090, {
    auth: {
        authHandlers: [inboundBasicAuthHandler]
    },
    secureSocket: {
        keyStore: {
            path: "${ballerina.home}/bre/security/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

jwt:OutboundJwtAuthProvider outboundJwtAuthProvider = new({
    username: "ballerina",
    issuer: "ballerina",
    audience: ["ballerina", "ballerina.org", "ballerina.io"],
    customClaims: { "scope": "hello" },
    keyStoreConfig: {
        keyAlias: "ballerina",
        keyPassword: "ballerina",
        keyStore: {
            path: "${ballerina.home}/bre/security/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});
http:BearerAuthHandler outboundJwtAuthHandler = new(outboundJwtAuthProvider);

http:Client jwtAuthSecuredClient = new("https://localhost:9091", {
    auth: {
        authHandler: outboundJwtAuthHandler
    },
    secureSocket: {
        trustStore: {
            path: "${ballerina.home}/bre/security/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});

@http:ServiceConfig {
	basePath: "/hello"
}
service basicAuthSecuredService on basicAuthSecuredListener {

    @http:ResourceConfig {
	    path: "/sayHello"
	}
    resource function basicAuthSecuredResource(http:Caller caller, http:Request req) {
        var response = jwtAuthSecuredClient->get("/hello/sayHello");
        if (response is http:Response) {
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Failed to respond the caller.", err = result);
            }
        } else {
            log:printError("Failed to call the endpoint.", err = response);
        }
        checkpanic caller->respond("Something went wrong at basic auth secured service.");
    }
}
