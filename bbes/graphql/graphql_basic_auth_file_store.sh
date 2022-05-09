source assert.sh

mkdir bbe
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/graphql-service-basic-auth-file-user-store/graphql_service_basic_auth_file_user_store.bal -o bbe/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-basic-auth/http_client_basic_auth.bal -o bbe/client.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-basic-auth-file-user-store/Config.toml -o bbe/Config.toml

export BAL_CONFIG_FILES=bbe/Config.toml

sed -i 's+../resource/path/to+resources+g' bbe/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client.bal
sed -i 's+string response = check securedEP->get("/foo/bar");+json response = check securedEP->post("/graphql", { "query": "{ greeting }" });+g' bbe/client.bal

echo -e "\n--- Testing BBE ---"
bal run bbe/service.bal &
sleep 15s
response=$(bal run bbe/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"greeting\":\"Hello, World!\"}}"
