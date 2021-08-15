source scripts/assert.sh

mkdir bbe
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/websocket-service-basic-auth-file-user-store/websocket_service_basic_auth_file_user_store.bal -o bbe/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/websocket-client-basic-auth/websocket_client_basic_auth.bal -o bbe/client.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/websocket-service-basic-auth-file-user-store/Config.toml -o bbe/Config.toml

export BAL_CONFIG_FILES=bbe/Config.toml

sed -i 's+../resource/path/to+resources+g' bbe/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client.bal

echo -e "\n--- Testing BBE ---"
bal run bbe/service.bal &
sleep 10s
response=$(bal run bbe/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
