source scripts/assert.sh
source scripts/common.sh

mkdir oauth2
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-service-oauth2/http_service_oauth2.bal -o oauth2/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-client-oauth2-refresh-token-grant-type/http_client_oauth2_refresh_token_grant_type.bal -o oauth2/client.bal

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
