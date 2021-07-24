import ballerina/http;

listener http:Listener inventoryEP = new(9091,
    secureSocket = {
        key: {
            certFile: "./_resources/public.crt",
            keyFile: "./_resources/private.key"
        },
        mutualSsl: {
            verifyClient: http:REQUIRE,
            cert: "./_resources/public.crt"
        }
    }
);

service /inventory on inventoryEP {
    resource function get electronics() returns json {
        return [
            {
                "code": "APMBA132021",
                "brand": "Apple",
                "model": "Mac Book AIR M1 (13-inch 2021)",
                "price": "$1249.00",
                "qty": 32
            },
            {
                "code": "SOWH1000XM4",
                "brand": "Sony",
                "model": "WH-1000XM4",
                "price": "$349.99",
                "qty": 75
            }
        ];
    }
}
