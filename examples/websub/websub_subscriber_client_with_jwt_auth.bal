//import ballerina/log;
//import ballerina/websub;
//
//public function main() returns error? {
//    websub:SubscriptionClient subscriberClient = check new("https://localhost:9090/websubhub", {
//        auth: {
//            username: "ballerina",
//            issuer: "wso2",
//            audience: ["ballerina", "ballerina.org", "ballerina.io"],
//            keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
//            jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
//            customClaims: { "scp": "hello" },
//            expTime: 3600,
//            signatureConfig: {
//                config: {
//                    keyFile: "../resources/private.key"
//                }
//            }
//        },
//        secureSocket: {
//            cert: "../resources/public.crt"
//        }
//    });
//    websub:SubscriptionChangeRequest request = {
//        topic: "Ballerina",
//        callback: "https://localhost:8080/subscriber",
//        secret: "b745e11a57e9"
//    };
//    websub:SubscriptionChangeResponse|error response = subscriberClient->subscribe(request);
//    if (response is websub:SubscriptionChangeResponse) {
//        log:printInfo("Suscription successful for hub: '" + response.hub + "' and topic: '" + response.topic + "'.");
//    } else {
//        log:printError("Suscription failed!.", 'error = response);
//    }
//}
