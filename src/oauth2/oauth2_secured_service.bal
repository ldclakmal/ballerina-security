import ballerina/auth;
import ballerina/http;
import ballerina/oauth2;

auth:OutboundBasicAuthProvider outboundBasiAuthProvider = new({
    username: "admin",
    password: "admin"
});
http:BasicAuthHandler outboundBasicAuthHandler = new(outboundBasiAuthProvider);

oauth2:IntrospectionServerConfig introspectionServerConfig = {
    url: "https://localhost:9443/oauth2/introspect",
    clientConfig: {
        auth: {
            authHandler: outboundBasicAuthHandler
        },
        secureSocket: {
           trustStore: {
               path: "src/oauth2/resources/ballerinaTruststore.p12",
               password: "ballerina"
           }
        }
    }
};
oauth2:InboundOAuth2Provider inboundOAuth2Provider = new(introspectionServerConfig);
http:BearerAuthHandler inboundOAuth2Handler = new(inboundOAuth2Provider);

listener http:Listener oAuth2SecuredListener = new(9090, {
    auth: {
        authHandlers: [inboundOAuth2Handler]
    },
    secureSocket: {
        keyStore: {
            path: "src/oauth2/resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

@http:ServiceConfig {
	basePath: "/hello"
}
service oAuth2SecuredService on oAuth2SecuredListener {

    @http:ResourceConfig {
	    path: "/sayHello"
	}
    resource function oAuth2SecuredResource(http:Caller caller, http:Request req) {
        checkpanic caller->respond("Successful!");
    }
}
