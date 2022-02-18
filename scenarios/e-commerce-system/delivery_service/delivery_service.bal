import ballerina/grpc;
import ballerina/protobuf.types.wrappers;
import ballerina/regex;
import ballerina/uuid;

listener grpc:Listener deliveryEP = new (9192,
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
                issuer: "order-service",
                audience: "delivery-service",
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
    descriptor: ROOT_DESCRIPTOR_DELIVERY,
    descMap: getDescriptorMapDelivery()
}
service "DeliveryService" on deliveryEP {
    remote function delivery(wrappers:ContextString request) returns string {
        [string, string] [orderId, deliveryMethod] = extractParameters(request.content);
        return processDelivery(orderId, deliveryMethod).toJsonString();
    }
}

function extractParameters(string content) returns [string, string] {
    string orderId = "";
    string deliveryMethod = "";
    string[] params = regex:split(content, "&");
    foreach string param in params {
        if param.startsWith("order_id") {
            orderId = regex:split(param, "=")[1];
        } else if param.startsWith("delivery_method") {
            deliveryMethod = regex:split(param, "=")[1];
        }
    }
    return [orderId, deliveryMethod];
}

function processDelivery(string orderId, string deliveryMethod) returns json {
    // Business logic for processing delivery with external delivery partners.
    string deliveryId = uuid:createType4AsString();
    return {
        order_id: orderId,
        delivery_id: deliveryId,
        delivery_method: deliveryMethod
    };
}
