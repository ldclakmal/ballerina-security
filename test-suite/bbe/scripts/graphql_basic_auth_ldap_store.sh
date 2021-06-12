source scripts/assert.sh

mkdir auth
curl https://raw.githubusercontent.com/${1}/ballerina-distribution/${2}/examples/graphql-service-basic-auth-ldap-user-store/graphql_service_basic_auth_ldap_user_store.bal -o auth/service.bal
curl https://raw.githubusercontent.com/${1}/ballerina-distribution/${2}/examples/http-client-basic-auth/http_client_basic_auth.bal -o auth/client.bal

sed -i 's+../resource/path/to+resources+g' auth/service.bal
sed -i 's+../resource/path/to+resources+g' auth/client.bal
sed -i 's+string response = check securedEP->get("/foo/bar");+json response = check securedEP->post("/graphql", { "query": "{ greeting }" });+g' auth/client.bal

echo -e "\n--- Starting OpenLDAP Server ---"
docker-compose -f resources/docker-compose.yml up &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal run auth/service.bal &
sleep 10s
response=$(bal run auth/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"greeting\":\"Hello, World!\"}}"
