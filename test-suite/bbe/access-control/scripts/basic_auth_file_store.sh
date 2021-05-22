source scripts/assert.sh

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-basic-auth-file-user-store/http_service_with_basic_auth_file_user_store.bal > packages/basic-auth-file-store/http_service_with_basic_auth_file_user_store.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-with-basic-auth/http_client_with_basic_auth.bal > packages/basic-auth-file-store/http_client_with_basic_auth.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-basic-auth-file-user-store/Config.toml > packages/basic-auth-file-store/Config.toml

export BAL_CONFIG_FILES=packages/basic-auth-file-store/Config.toml

sed -i 's+../resource/path/to+resources+g' packages/basic-auth-file-store/http_service_with_basic_auth_file_user_store.bal
sed -i 's+../resource/path/to+resources+g' packages/basic-auth-file-store/http_client_with_basic_auth.bal

echo -e "\n--- Testing BBE ---"
bal run packages/basic-auth-file-store/http_service_with_basic_auth_file_user_store.bal &
sleep 10s
response=$(bal run packages/basic-auth-file-store/http_client_with_basic_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertStatusCode $response
