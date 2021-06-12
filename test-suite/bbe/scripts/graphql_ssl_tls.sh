source scripts/assert.sh

mkdir ssl
mkdir ssl/tests
echo '[package]
org = "ldclakmal"
name = "ssl"
version = "1.0.0"' > ssl/Ballerina.toml
curl https://raw.githubusercontent.com/${1}/ballerina-distribution/${2}/examples/graphql-service-ssl-tls/graphql_service_ssl_tls.bal -o ssl/service.bal
curl https://raw.githubusercontent.com/${1}/ballerina-distribution/${2}/examples/http-service-ssl-tls/tests/graphql_service_ssl_tls_test.bal -o ssl/tests/service_test.bal
sed -i 's+../resource/path/to+resources+g' ssl/service.bal
sed -i 's+../resource/path/to+resources+g' ssl/tests/service_test.bal
bal build ssl
sleep 10s

curl https://raw.githubusercontent.com/${1}/ballerina-distribution/${2}/examples/http-client-ssl-tls/http_client_ssl_tls.bal -o ssl/client.bal
sed -i 's+../resource/path/to+resources+g' ssl/client.bal
sed -i 's+string response = check securedEP->get("/foo/bar");+json response = check securedEP->post("/graphql", { "query": "{ greeting }" });+g' ssl/client.bal
rm ssl/Ballerina.toml
bal run ssl/service.bal &
sleep 10s
response=$(bal run ssl/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"greeting\":\"Hello, World!\"}}"
