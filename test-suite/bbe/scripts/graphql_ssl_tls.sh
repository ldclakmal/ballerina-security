source scripts/assert.sh
source scripts/common.sh

mkdir ssl
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/graphql-service-ssl-tls/graphql_service_ssl_tls.bal -o ssl/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-client-ssl-tls/http_client_ssl_tls.bal -o ssl/client.bal

sed -i 's+../resource/path/to+resources+g' ssl/service.bal
sed -i 's+../resource/path/to+resources+g' ssl/client.bal
sed -i 's+string response = check securedEP->get("/foo/bar");+json response = check securedEP->post("/graphql", { "query": "{ greeting }" });+g' ssl/client.bal

echo -e "\n--- Testing BBE ---"
bal run ssl/service.bal &
sleep 10s
response=$(bal run ssl/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"greeting\":\"Hello, World!\"}}"
