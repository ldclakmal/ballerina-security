source assert.sh

mkdir bbe
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-basic-authentication-file-user-store/http_service_basic_authentication_file_user_store.bal -o bbe/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-basic-authentication/http_client_basic_authentication.bal -o bbe/client.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-basic-authentication-file-user-store/Config.toml -o bbe/Config.toml

export BAL_CONFIG_FILES=bbe/Config.toml

sed -i 's+../resource/path/to+resources+g' bbe/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client.bal

echo -e "\n--- Testing BBE ---"
bal run bbe/service.bal &
sleep 20s
response=$(bal run bbe/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "[{\"title\":\"Blue Train\",\"artist\":\"John Coltrane\"},{\"title\":\"Jeru\",\"artist\":\"Gerry Mulligan\"}]"
