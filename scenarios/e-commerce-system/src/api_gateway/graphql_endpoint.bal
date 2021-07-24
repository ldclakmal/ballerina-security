import ballerina/http;
import ballerina/graphql;

type ElectronicItem record {
    string code;
    string brand;
    string model;
    string price;
    int qty;
};

http:Client inventoryClient = check new("https://localhost:9091",
    secureSocket = {
        cert: "./_resources/public.crt",
        key: {
            certFile: "./_resources/public.crt",
            keyFile: "./_resources/private.key"
        }
    }
);

@graphql:ServiceConfig {
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
service /inventory on new graphql:Listener(apiGateway) {
    resource function get electronics() returns ElectronicItem[]|error {
        ElectronicItem[] electronics = check inventoryClient->get("/inventory/electronics");
        return electronics;
    }
}
