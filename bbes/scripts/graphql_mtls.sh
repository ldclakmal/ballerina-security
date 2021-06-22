source scripts/assert.sh
source scripts/common.sh

mkdir mtls
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/graphql-service-mutual-ssl/graphql_service_mutual_ssl.bal -o mtls/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-client-mutual-ssl/http_client_mutual_ssl.bal -o mtls/client.bal

sed -i 's+../resource/path/to+resources+g' mtls/service.bal
sed -i 's+../resource/path/to+resources+g' mtls/client.bal
sed -i 's+string response = check securedEP->get("/foo/bar");+json response = check securedEP->post("/graphql", { "query": "{ greeting }" });+g' mtls/client.bal

echo -e "\n--- Testing BBE ---"
bal run mtls/service.bal &
sleep 10s
response=$(bal run mtls/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"greeting\":\"Hello, World!\"}}"
