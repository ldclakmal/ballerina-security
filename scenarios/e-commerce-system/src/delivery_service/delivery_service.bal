import ballerina/grpc;
import ballerina/jwt;
import ballerina/regex;
import ballerina/uuid;

listener grpc:Listener deliveryEP = new(9192,
    secureSocket = {
        key: {
            certFile: "./_resources/public.crt",
            keyFile: "./_resources/private.key"
        }
    }
);

grpc:ListenerJwtAuthHandler handler = new({
    issuer: "order-service",
    audience: "delivery-service",
    signatureConfig: {
        certFile: "./_resources/public.crt"
    },
    scopeKey: "scp"
});

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR,
    descMap: getDescriptorMap()
}
service "DeliveryService" on deliveryEP {
    remote function delivery(ContextString request) returns string|grpc:UnauthenticatedError|grpc:PermissionDeniedError {
        jwt:Payload|grpc:UnauthenticatedError authn = handler.authenticate(request.headers);
        if (authn is grpc:UnauthenticatedError) {
            return authn;
        } else {
            grpc:PermissionDeniedError? authz = handler.authorize(authn, "admin");
            if (authz is grpc:PermissionDeniedError) {
                return authz;
            }
            [string, string] [orderId, deliveryMethod] = extractParameters(request.content);
            return processDelivery(orderId, deliveryMethod).toJsonString();
        }
    }
}

function extractParameters(string content) returns [string, string] {
    string orderId = "";
    string deliveryMethod = "";
    string[] params = regex:split(content, "&");
    foreach string param in params {
        if (param.startsWith("order_id")) {
            orderId = regex:split(param, "=")[1];
        } else if (param.startsWith("delivery_method")) {
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
