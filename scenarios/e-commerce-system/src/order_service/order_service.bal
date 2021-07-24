import ballerina/grpc;
import ballerina/http;
import ballerina/regex;

listener http:Listener ordersEP = new(9092,
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

PaymentServiceClient paymentServiceClient = check new("https://localhost:9191",
    secureSocket = {
        cert: "./_resources/public.crt"
    }
);

DeliveryServiceClient deliveryServiceClient = check new("https://localhost:9192",
    secureSocket = {
        cert: "./_resources/public.crt"
    }
);

service /orders on ordersEP {
    resource function post [string orderId](@http:Payload {} string payload) returns json|error {
        grpc:ClientSelfSignedJwtAuthHandler handler = new({
            issuer: "order-service",
            audience: ["payment-service", "delivery-service"],
            keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
            jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
            customClaims: { "scp": "admin" },
            expTime: 3600,
            signatureConfig: {
                config: {
                    keyFile: "./_resources/private.key"
                }
            }
        });
        map<string|string[]> headers = {};
        headers = check handler.enrich(headers);

        string paymentMethod = "";
        string deliveryMethod = "";
        string[] params = regex:split(payload, "&");
        foreach string param in params {
            if (param.startsWith("payment_method")) {
                paymentMethod = regex:split(param, "=")[1];
            } else if (param.startsWith("delivery_method")) {
                deliveryMethod = regex:split(param, "=")[1];
            }
        }

        ContextString paymentContext = { content: "order_id=" + orderId + "&payment_method=" + paymentMethod, headers: headers };
        json paymentResponse = check paymentServiceClient->payments(paymentContext);

        ContextString deliveryContext = { content: "order_id=" + orderId + "&delivery_method=" + deliveryMethod, headers: headers };
        json deliveryResponse =  check deliveryServiceClient->delivery(deliveryContext);

        return {
            payment: paymentResponse,
            delivery: deliveryResponse
        };
    }
}
