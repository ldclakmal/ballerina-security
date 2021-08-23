import ballerina/grpc;

listener grpc:Listener securedEP = new(9090,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

@grpc:ServiceConfig {
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
@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR_GRPC,
    descMap: getDescriptorMapGrpc()
}
service "HelloWorld" on securedEP {
    remote function hello() returns string {
        return "Hello, World!";
    }
}
