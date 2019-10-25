import ballerina/http;
import ballerina/oauth2;

oauth2:IntrospectionServerConfig introspectionServerConfig = {
    url: "https://localhost:9191/oauth2/token/introspect",
    clientConfig: {
        secureSocket: {
           trustStore: {
               path: "${ballerina.home}/bre/security/ballerinaTruststore.p12",
               password: "ballerina"
           }
        }
    }
};
oauth2:InboundOAuth2Provider inboundOAuth2Provider = new(introspectionServerConfig);
http:BearerAuthHandler inboundOAuth2Handler = new(inboundOAuth2Provider);

listener http:Listener oAuth2SecuredListener = new(9092, {
    auth: {
        authHandlers: [inboundOAuth2Handler]
    },
    secureSocket: {
        keyStore: {
            path: "${ballerina.home}/bre/security/ballerinaKeystore.p12",
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
