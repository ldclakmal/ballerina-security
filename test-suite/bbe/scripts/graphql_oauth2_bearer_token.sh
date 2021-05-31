source scripts/assert.sh

mkdir oauth2
curl https://raw.githubusercontent.com/ldclakmal/ballerina-distribution/bbe-revamp/new-examples/graphql-service-oauth2/graphql_service_oauth2.bal -o oauth2/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/http-client-bearer-token-auth/http_client_bearer_token_auth.bal -o oauth2/client.bal

sed -i 's+../resource/path/to+resources+g' oauth2/service.bal
sed -i 's+../resource/path/to+resources+g' oauth2/client.bal
sed -i 's+http:Response response = check securedEP->get("/foo/bar");+http:Response response = check securedEP->post("/graphql", { "query": "{ greeting }" }, "application/json");+g' oauth2/client.bal
sed -i 's+io:println(check response.getTextPayload());+io:println((check response.getJsonPayload()).toString());+g' oauth2/client.bal

echo -e "\n--- Starting Ballerina STS ---"
docker run --rm -p 9445:9445 --name ballerina-sts ldclakmal/ballerina-sts:latest &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run oauth2/service.bal &
sleep 10s
response=$(bal run oauth2/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"greeting\":\"Hello, World!\"}}"
