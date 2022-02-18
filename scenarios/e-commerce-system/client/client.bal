import ballerina/http;
import ballerina/io;

final http:Client webAppClient = check new ("https://localhost:9090",
    auth = {
       tokenUrl: "https://localhost:9443/oauth2/token",
       clientId: "uDMwA4hKR9H3deeXxvNf4sSU0i4a",
       clientSecret: "8FOUOKUQfOp47pUfJCsPA5X4clga",
       scopes: ["customer"],
       clientConfig: {
           secureSocket: {
               cert: "./resources/sts-public.crt"
           }
       }
    },
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

public function main() returns error? {
    json searchPayload = { "query": "{ electronics { brand, model, price } }" };
    json searchResponse = check webAppClient->post("/inventory", searchPayload);

    json payload = {
        orderId: "HQCKJ5496",
        category: "electronics",
        code: "SOWH1000XM4",
        qty: 2,
        paymentMethod: "VISA...1234",
        deliveryMethod: "DM01"
    };
    json orderResponse = check webAppClient->post("/orders", payload);

    json result = {
        "search_response": searchResponse,
        "order_response": orderResponse
    };
    io:println(result);
}
