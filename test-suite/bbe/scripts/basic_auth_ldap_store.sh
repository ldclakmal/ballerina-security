source scripts/assert.sh

mkdir auth
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-basic-auth-ldap-user-store/http_service_with_basic_auth_ldap_user_store.bal -o auth/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-with-basic-auth/http_client_with_basic_auth.bal -o auth/client.bal

sed -i 's+../resource/path/to+resources+g' auth/service.bal
sed -i 's+../resource/path/to+resources+g' auth/client.bal

echo -e "\n--- Starting OpenLDAP Server ---"
docker-compose -f resources/docker-compose.yml up &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run auth/service.bal &
sleep 10s
response=$(bal run auth/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
