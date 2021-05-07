import ballerina/http;

listener http:Listener securedEP = new(9090,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

@http:ServiceConfig {
    auth: [
        {
            fileUserStoreConfig: {},
            scopes: ["hello"]
        }
    ]
}
service /foo on securedEP {
    resource function get bar() returns string {
        return "Hello, World!";
    }
}
