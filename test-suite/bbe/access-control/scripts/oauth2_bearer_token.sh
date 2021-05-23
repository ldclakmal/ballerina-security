source scripts/assert.sh

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-oauth2/http_service_with_oauth2.bal > packages/oauth2-bearer-token/http_service_with_oauth2.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-with-bearer-token-auth/http_client_with_bearer_token_auth.bal > packages/oauth2-bearer-token/http_client_with_bearer_token_auth.bal

sed -i 's+../resource/path/to+resources+g' packages/oauth2-bearer-token/http_service_with_oauth2.bal
sed -i 's+../resource/path/to+resources+g' packages/oauth2-bearer-token/http_client_with_bearer_token_auth.bal

echo -e "\n--- Starting Ballerina STS ---"
docker run --rm -p 9445:9445 --name ballerina-sts ldclakmal/ballerina-sts:latest &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run packages/oauth2-bearer-token/http_service_with_oauth2.bal &
sleep 10s
response=$(bal run packages/oauth2-bearer-token/http_client_with_bearer_token_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
