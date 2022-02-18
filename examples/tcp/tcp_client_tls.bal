import ballerina/io;
import ballerina/tcp;

final tcp:Client securedEP = check new ("localhost", 3000,
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

public function main() returns error? {
    check securedEP->writeBytes("Hello, World!".toBytes());
    readonly & byte[] receivedData = check securedEP->readBytes();
    io:println("Received message: ", string:fromBytes(receivedData));
    check securedEP->close();
}
