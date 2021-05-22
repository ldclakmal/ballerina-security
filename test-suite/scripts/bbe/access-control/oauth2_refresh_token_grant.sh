source scripts/validate.sh

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-oauth2/http_service_with_oauth2.bal > packages/bbe/access-control/oauth2-refresh-token-grant/http_service_with_oauth2.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-with-oauth2-refresh-token-grant-type/http_client_with_oauth2_refresh_token_grant_type.bal > packages/bbe/access-control/oauth2-refresh-token-grant/http_client_with_oauth2_refresh_token_grant_type.bal

sed -i 's+../resource/path/to+packages/resources+g' packages/bbe/access-control/oauth2-refresh-token-grant/http_service_with_oauth2.bal
sed -i 's+../resource/path/to+packages/resources+g' packages/bbe/access-control/oauth2-refresh-token-grant/http_client_with_oauth2_refresh_token_grant_type.bal

echo -e "\n--- Starting Ballerina STS ---"
docker run --rm -p 9445:9445 --name ballerina-sts ldclakmal/ballerina-sts:latest &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run packages/bbe/access-control/oauth2-refresh-token-grant/http_service_with_oauth2.bal &
sleep 10s
response=$(bal run packages/bbe/access-control/oauth2-refresh-token-grant/http_client_with_oauth2_refresh_token_grant_type.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertStatusCode $response
