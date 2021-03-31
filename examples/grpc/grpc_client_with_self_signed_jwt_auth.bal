import ballerina/grpc;
import ballerina/log;

HelloWorldClient ep = check new("https://localhost:9090", {
    secureSocket: {
        cert: "../resources/public.crt"
    }
});

public function main() returns error? {
    grpc:JwtIssuerConfig config = {
        username: "ballerina",
        issuer: "wso2",
        audience: ["ballerina", "ballerina.org", "ballerina.io"],
        keyId: "5a0b754-895f-4279-8843-b745e11a57e9",
        jwtId: "JlbmMiOiJBMTI4Q0JDLUhTMjU2In",
        customClaims: { "scp": "hello" },
        expTime: 3600,
        signatureConfig: {
            config: {
                keyFile: "../resources/private.key"
            }
        }
    };
    grpc:ClientSelfSignedJwtAuthHandler handler = new(config);
    map<string|string[]> headers = {};
    headers = check handler.enrich(headers);
    ContextString requestMessage = { content: "Ballerina", headers: headers };
    ContextString result = check ep->fooContext(requestMessage);
    log:printInfo(result.content);
}


// --- Generated Stub ---

public client class HelloWorldClient {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        // initialize client endpoint.
        self.grpcClient = check new(url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR, getDescriptorMap());
    }

    isolated remote function foo(string|ContextString req) returns (string|grpc:Error) {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("HelloWorld/foo", message, headers);
        [anydata, map<string|string[]>][result, _] = payload;
        return result.toString();
    }

    isolated remote function fooContext(string|ContextString req) returns (ContextString|grpc:Error) {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("HelloWorld/foo", message, headers);
        [anydata, map<string|string[]>][result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }
}

public type ContextString record {|
    string content;
    map<string|string[]> headers;
|};

const string ROOT_DESCRIPTOR = "0A0A677270632E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F" +
                               "746F324F0A0A48656C6C6F576F726C6412410A03666F6F121C2E676F6F676C652E70726F746F6275662E" +
                               "537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756562" +
                               "0670726F746F33";
isolated function getDescriptorMap() returns map<string> {
    return {
        "grpc.proto":"0A0A677270632E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F324F0A" +
        "0A48656C6C6F576F726C6412410A03666F6F121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6" +
        "F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F" +
        "676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A4" +
        "66C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C75" +
        "65180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220" +
        "A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576" +
        "616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C7565222" +
        "30A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A05" +
        "76616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726" +
        "F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573" +
        "620670726F746F33"
    };
}
