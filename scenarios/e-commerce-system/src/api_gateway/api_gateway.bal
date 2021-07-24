import ballerina/http;

listener http:Listener apiGateway = new(9090,
    secureSocket = {
        key: {
            certFile: "./_resources/public.crt",
            keyFile: "./_resources/private.key"
        }
    }
);
