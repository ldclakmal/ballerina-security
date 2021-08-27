import ballerina/grpc;
import ballerina/jwt;
import ballerina/regex;
import ballerina/uuid;

listener grpc:Listener paymentsEP = new(9191,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

grpc:ListenerJwtAuthHandler handler = new({
    issuer: "order-service",
    audience: "payment-service",
    signatureConfig: {
        certFile: "./resources/public.crt"
    },
    scopeKey: "scp"
});

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR,
    descMap: getDescriptorMap()
}
service "PaymentService" on paymentsEP {
    remote function payments(ContextString request) returns string|grpc:UnauthenticatedError|grpc:PermissionDeniedError {
        jwt:Payload|grpc:UnauthenticatedError authn = handler.authenticate(request.headers);
        if (authn is grpc:UnauthenticatedError) {
            return authn;
        } else {
            grpc:PermissionDeniedError? authz = handler.authorize(authn, "admin");
            if (authz is grpc:PermissionDeniedError) {
                return authz;
            }
            [string, string] [orderId, paymentMethod] = extractParameters(request.content);
            return processPayment(orderId, paymentMethod).toJsonString();
        }
    }
}

function extractParameters(string content) returns [string, string] {
    string orderId = "";
    string paymentMethod = "";
    string[] params = regex:split(content, "&");
    foreach string param in params {
        if (param.startsWith("order_id")) {
            orderId = regex:split(param, "=")[1];
        } else if (param.startsWith("payment_method")) {
            paymentMethod = regex:split(param, "=")[1];
        }
    }
    return [orderId, paymentMethod];
}

function processPayment(string orderId, string paymentMethod) returns json {
    // Business logic for processing payment with payment gateway.
    string invoiceId = uuid:createType4AsString();
    string invoiceAmount = "$349.99";

    return {
        order_id: orderId,
        invoice_id: invoiceId,
        payment_method: paymentMethod,
        amount: invoiceAmount
    };
}