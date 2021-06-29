import ballerina/io;
import ballerina/tcp;

tcp:Client securedEP = check new("localhost", 3000,
    secureSocket = {
        cert: "./resources/public.crt",
        // TODO: Remove `ciphers` once https://github.com/ballerina-platform/ballerina-standard-library/issues/1569 is fixed.
        ciphers: ["TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"]
    }
);

public function main() returns error? {
    check securedEP->writeBytes("Hello, World!".toBytes());
    readonly & byte[] receivedData = check securedEP->readBytes();
    io:println("Received message: ", string:fromBytes(receivedData));
    check securedEP->close();
}
