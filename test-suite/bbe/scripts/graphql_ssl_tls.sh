source scripts/assert.sh

mkdir ssl
mkdir ssl/tests
echo '[package]
org = "ldclakmal"
name = "ssl"
version = "1.0.0"' > ssl/Ballerina.toml
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/graphql-service-ssl-tls/graphql_service_ssl_tls.bal -o ssl/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-ssl-tls/tests/graphql_service_ssl_tls_test.bal -o ssl/tests/service_test.bal
sed -i 's+../resource/path/to+resources+g' ssl/service.bal
sed -i 's+../resource/path/to+resources+g' ssl/tests/service_test.bal
bal build ssl
sleep 10s

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-ssl-tls/http_client_ssl_tls.bal -o ssl/client.bal
sed -i 's+../resource/path/to+resources+g' ssl/client.bal
sed -i 's+http:Response response = check securedEP->get("/foo/bar");+http:Response response = check securedEP->post("/graphql", { "query": "{ greeting }" }, "application/json");+g' ssl/client.bal
sed -i 's+io:println(check response.getTextPayload());+io:println((check response.getJsonPayload()).toString());+g' ssl/client.bal
rm ssl/Ballerina.toml
bal run ssl/service.bal &
sleep 10s
response=$(bal run ssl/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"greeting\":\"Hello, World!\"}}"
