source assert.sh

mkdir bbe
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/websocket-service-oauth2/websocket_service_oauth2.bal -o bbe/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/websocket-client-oauth2-jwt-bearer-grant-type/websocket_client_oauth2_jwt_bearer_grant_type.bal -o bbe/client.bal

sed -i 's+../resource/path/to+resources+g' bbe/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client.bal

echo -e "\n--- Starting Ballerina STS ---"
docker run --rm -p 9445:9445 --name ballerina-sts ldclakmal/ballerina-sts:latest &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run bbe/service.bal &
sleep 20s
response=$(bal run bbe/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, How are you?"
