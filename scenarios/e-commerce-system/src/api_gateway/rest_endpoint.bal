import ballerina/http;

http:Client ordersClient = check new("https://localhost:9092",
    secureSocket = {
        cert: "./_resources/public.crt",
        key: {
            certFile: "./_resources/public.crt",
            keyFile: "./_resources/private.key"
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
                        cert: "./_resources/sts-public.crt"
                    }
                }
            },
            scopes: ["customer"]
        }
    ]
}
service /'orders on apiGateway {
    resource function post [string orderId](http:Request request) returns json|error {
        json response = check ordersClient->forward("/orders/" + orderId, request);
        return response;
    }
}
