import ballerina/http;
import ballerina/jwt;
import ballerina/log;

jwt:InboundJwtAuthProvider inboundJwtAuthProvider = new({
    issuer: "ballerina",
    audience: "ballerina.io",
    trustStoreConfig: {
        certificateAlias: "ballerina",
        trustStore: {
            path: "${ballerina.home}/bre/security/ballerinaTruststore.p12",
            password: "ballerina"
        }
    }
});
http:BearerAuthHandler inboundJwtAuthHandler = new(inboundJwtAuthProvider);

listener http:Listener jwtAuthSecuredListener = new(9091, {
    auth: {
        authHandlers: [inboundJwtAuthHandler]
    },
    secureSocket: {
        keyStore: {
            path: "${ballerina.home}/bre/security/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

jwt:OutboundJwtAuthProvider outboundOAuth2Provider = new({
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
http:BearerAuthHandler outboundOAuth2Handler = new(outboundOAuth2Provider);

http:Client oAuth2SecuredClient = new("https://localhost:9092", {
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
service jwtAuthSecuredService on jwtAuthSecuredListener {

    @http:ResourceConfig {
	    path: "/sayHello"
	}
    resource function jwtAuthSecuredResource(http:Caller caller, http:Request req) {
        var response = oAuth2SecuredClient->get("/hello/sayHello");
        if (response is http:Response) {
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Failed to respond the caller.", err = result);
            }
        } else {
            log:printError("Failed to call the endpoint.", err = response);
        }
        checkpanic caller->respond("Something went wrong at jwt auth secured service.");
    }
}
