import ballerina/io;
import ballerina/tcp;

listener tcp:Listener securedEP = check new (3000,
    secureSocket = {
        key: {
            certFile: "./resources/public.crt",
            keyFile: "./resources/private.key"
        }
    }
);

isolated service on securedEP {
    isolated remote function onConnect(tcp:Caller caller) returns tcp:ConnectionService {
        io:println("Client connected on server port: ", caller.remotePort);
        return new EchoService();
    }
}

isolated service class EchoService {

    *tcp:ConnectionService;

    isolated remote function onBytes(readonly & byte[] data) returns byte[] {
        io:println("Received message: ", string:fromBytes(data));
        return data;
    }
}
