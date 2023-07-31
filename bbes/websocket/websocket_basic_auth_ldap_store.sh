source assert.sh

mkdir bbe
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/websocket-service-basic-auth-ldap-user-store/websocket_service_basic_auth_ldap_user_store.bal -o bbe/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/websocket-client-basic-auth/websocket_client_basic_auth.bal -o bbe/client.bal

sed -i 's+../resource/path/to+resources+g' bbe/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client.bal

echo -e "\n--- Starting OpenLDAP Server ---"
docker-compose -f resources/docker-compose.yml up &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run bbe/service.bal &
sleep 20s
response=$(bal run bbe/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, How are you?"
