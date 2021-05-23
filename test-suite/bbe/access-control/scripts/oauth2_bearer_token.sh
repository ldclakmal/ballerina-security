source scripts/assert.sh

mkdir oauth2
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-oauth2/http_service_with_oauth2.bal -o oauth2/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-with-bearer-token-auth/http_client_with_bearer_token_auth.bal -o oauth2/client.bal

sed -i 's+../resource/path/to+resources+g' oauth2/service.bal
sed -i 's+../resource/path/to+resources+g' oauth2/client.bal

echo -e "\n--- Starting Ballerina STS ---"
docker run --rm -p 9445:9445 --name ballerina-sts ldclakmal/ballerina-sts:latest &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run oauth2/service.bal &
sleep 10s
response=$(bal run oauth2/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
