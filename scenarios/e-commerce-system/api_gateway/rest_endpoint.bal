import ballerina/http;

final http:Client ordersClient = check new ("https://localhost:9092",
    secureSocket = {
        cert: "./resources/public.crt",
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

@http:ServiceConfig {
    auth: [
        {
            oauth2IntrospectionConfig: {
                url: "https://localhost:9443/oauth2/introspect",
                clientConfig: {
                    customHeaders: {"Authorization": "Basic YWRtaW46YWRtaW4="},
                    secureSocket: {
                        cert: "./resources/sts-public.crt"
                    }
                }
            },
            scopes: ["customer"]
        }
    ]
}
service /'orders on apiGateway {
    resource function post .(http:Request request) returns json|error {
        json response = check ordersClient->forward("/orders", request);
        return response;
    }
}
