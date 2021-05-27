import ballerina/graphql;

listener graphql:Listener securedEP = new(9090,
   secureSocket = {
       key: {
           certFile: "./resources/public.crt",
           keyFile: "./resources/private.key"
       }
   }
);

@graphql:ServiceConfig {
    auth: [
        {
            jwtValidatorConfig: {
                issuer: "wso2",
                audience: "ballerina",
                signatureConfig: {
                    certFile: "./resources/public.crt"
                },
                scopeKey: "scp"
            },
            scopes: ["admin"]
        }
    ]
}
service /foo on securedEP {
    resource function get bar() returns string {
        return "Hello, World!";
    }
}
