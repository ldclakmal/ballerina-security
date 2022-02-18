import ballerina/grpc;
import ballerina/http;
import ballerina/lang.value;
import ballerina/protobuf.types.wrappers;

type OrderRequest record {|
    string orderId;
    string category;
    string code;
    int qty;
    string paymentMethod;
    string deliveryMethod;
|};

type UpdateRequest record {|
    string code;
    int qty;
|};

map<OrderRequest> ordersMap = {};

final PaymentServiceClient paymentServiceClient = check new ("https://localhost:9191",
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

final DeliveryServiceClient deliveryServiceClient = check new ("https://localhost:9192",
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

final http:Client inventoryClient = check new ("https://localhost:9091",
    secureSocket = {
        cert: "./resources/public.crt",
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

listener http:Listener ordersEP = new (9092,
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

service /orders on ordersEP {
    resource function post .(@http:Payload OrderRequest orderRequest) returns json|error {
        grpc:ClientSelfSignedJwtAuthHandler handler = new ({
            issuer: "order-service",
            audience: ["payment-service", "delivery-service"],
            keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
            jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
            customClaims: { "scp": "admin" },
            expTime: 3600,
            signatureConfig: {
                config: {
                    keyFile: "./resources/private.key"
                }
            }
        });
        map<string|string[]> headers = {};
        headers = check handler.enrich(headers);

        ordersMap[orderRequest.orderId] = orderRequest;

        UpdateRequest updateRequest = {
            code: orderRequest.code,
            qty: orderRequest.qty
        };
        json|http:ClientError response = inventoryClient->put("/inventory/" + orderRequest.category, updateRequest);
        if response is http:ClientError {
            return error("Failed to update the inventory quantity.", response);
        }

        wrappers:ContextString paymentContext = { content: "order_id=" + orderRequest.orderId + "&payment_method=" +
                                                  orderRequest.paymentMethod, headers: headers };
        string paymentResponse = check paymentServiceClient->payments(paymentContext);

        wrappers:ContextString deliveryContext = { content: "order_id=" + orderRequest.orderId + "&delivery_method=" +
                                                   orderRequest.deliveryMethod, headers: headers };
        string deliveryResponse = check deliveryServiceClient->delivery(deliveryContext);

        return {
            payment: check value:fromJsonString(paymentResponse),
            delivery: check value:fromJsonString(deliveryResponse)
        };
    }
}
