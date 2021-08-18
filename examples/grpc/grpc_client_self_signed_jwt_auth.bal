import ballerina/grpc;
import ballerina/io;

HelloWorldClient securedEP = check new("https://localhost:9090",
    auth = {
        username: "ballerina",
        issuer: "wso2",
        audience: ["ballerina", "ballerina.org", "ballerina.io"],
        keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
        jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
        customClaims: { "scp": "admin" },
        expTime: 3600,
        signatureConfig: {
            config: {
                keyFile: "./resources/private.key"
            }
        }
    },
    secureSocket = {
        cert: "./resources/public.crt"
    }
);

public function main() returns error? {
    ContextString result = check securedEP->hello();
    io:println(result.content);
}

// --- Generated Stub ---

public isolated client class HelloWorldClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR, getDescriptorMap());
    }

    isolated remote function hello() returns (string|grpc:Error) {
        Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("HelloWorld/hello", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function helloContext() returns (ContextString|grpc:Error) {
        Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("HelloWorld/hello", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }
}

public client class HelloWorldStringCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextNil record {|
    map<string|string[]> headers;
|};

public type ContextString record {|
    string content;
    map<string|string[]> headers;
|};

public type Empty record {|
|};

const string ROOT_DESCRIPTOR = "0A0A677270632E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F1A" +
                               "1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F324B0A0A48656C6C6F576F" +
                               "726C64123D0A0568656C6C6F12162E676F6F676C652E70726F746F6275662E456D7074791A1C2E676F6F" +
                               "676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";

isolated function getDescriptorMap() returns map<string> {
    return {
        "google/protobuf/empty.proto": "0A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F120F676F6F676C652E" +
        "70726F746F62756622070A05456D70747942540A13636F6D2E676F6F676C652E70726F746F627566420A456D70747950726F746F500" +
        "15A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E547970657362067072" +
        "6F746F33",
        "google/protobuf/wrappers.proto": "0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6" +
        "F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A" +
        "466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7" +
        "565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C75652222" +
        "0A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A057" +
        "6616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522" +
        "230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0" +
        "576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D57726170706572735072" +
        "6F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E547970657" +
        "3620670726F746F33",
        "grpc.proto": "0A0A677270632E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F1A1E676F6F6" +
        "76C652F70726F746F6275662F77726170706572732E70726F746F324B0A0A48656C6C6F576F726C64123D0A0568656C6C6F12162E67" +
        "6F6F676C652E70726F746F6275662E456D7074791A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75656206707" +
        "26F746F33"};
}
