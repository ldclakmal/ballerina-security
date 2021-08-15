import ballerina/http;
import ballerina/io;

http:Client webAppClient = check new("https://localhost:9090",
    auth = {
       tokenUrl: "https://localhost:9443/oauth2/token",
       clientId: "uDMwA4hKR9H3deeXxvNf4sSU0i4a",
       clientSecret: "8FOUOKUQfOp47pUfJCsPA5X4clga",
       scopes: ["customer"],
       clientConfig: {
           secureSocket: {
               cert: "../_resources/sts-public.crt"
           }
       }
    },
    secureSocket = {
        cert: "../_resources/public.crt"
    }
);

public function main() returns error? {
    json searchPayload = { "query": "{ electronics { brand, model, price } }" };
    json searchResponse = check webAppClient->post("/inventory", searchPayload);
    io:println(searchResponse);

    string orderId = "HQCKJ5496";
    string paymentMethod = "VISA...1234";
    string deliveryMethod = "DM01";
    string orderPayload = "order_id=" + orderId + "&payment_method=" + paymentMethod + "&delivery_method=" + deliveryMethod;
    json orderResponse = check webAppClient->post("/orders/" + orderId, orderPayload);
    io:println(orderResponse);
}
