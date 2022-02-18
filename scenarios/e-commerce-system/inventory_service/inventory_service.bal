import ballerina/http;

type UpdateRequest record {|
    string code;
    int qty;
|};

listener http:Listener inventoryEP = new (9091,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        },
        mutualSsl: {
            verifyClient: http:REQUIRE,
            cert: "./resources/public.crt"
        }
    }
);

service /inventory on inventoryEP {
    resource function get [string category]() returns json {
        return inventory[category].toJson();
    }

    resource function put [string category](@http:Payload UpdateRequest updateRequest) returns json {
        table<InventoryItem> key(code) inventoryTable = <table<InventoryItem> key(code)>inventory[category];
        InventoryItem item = inventoryTable.get(updateRequest.code);
        item.qty -= updateRequest.qty;
        return item;
    }
}
