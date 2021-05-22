source scripts/validate.sh

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-basic-auth-ldap-user-store/http_service_with_basic_auth_ldap_user_store.bal > packages/bbe/access-control/basic-auth-ldap-store/http_service_with_basic_auth_ldap_user_store.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-with-basic-auth/http_client_with_basic_auth.bal > packages/bbe/access-control/basic-auth-ldap-store/http_client_with_basic_auth.bal

sed -i 's+../resource/path/to+packages/resources+g' packages/bbe/access-control/basic-auth-ldap-store/http_service_with_basic_auth_ldap_user_store.bal
sed -i 's+../resource/path/to+packages/resources+g' packages/bbe/access-control/basic-auth-ldap-store/http_client_with_basic_auth.bal

echo -e "\n--- Starting OpenLDAP Server ---"
docker-compose -f scripts/resources/docker-compose.yml up &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run packages/bbe/access-control/basic-auth-ldap-store/http_service_with_basic_auth_ldap_user_store.bal &
sleep 10s
response=$(bal run packages/bbe/access-control/basic-auth-ldap-store/http_client_with_basic_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertStatusCode $response
