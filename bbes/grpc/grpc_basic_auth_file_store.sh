source assert.sh

mkdir bbe
mkdir bbe/service
mkdir bbe/client
touch bbe/service/Ballerina.toml
touch bbe/client/Ballerina.toml

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-service-basic-auth-file-user-store/grpc_service_basic_auth_file_user_store.bal -o bbe/service/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-service-basic-auth-file-user-store/grpc_service.proto -o bbe/service/grpc_service.proto
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-client-basic-auth/grpc_client_basic_auth.bal -o bbe/client/client.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-client-basic-auth/grpc_client.proto -o bbe/client/grpc_client.proto
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-service-basic-auth-file-user-store/Config.toml -o bbe/service/Config.toml


bal grpc --input bbe/service/grpc_service.proto --output bbe/service/
bal grpc --input bbe/client/grpc_client.proto --output bbe/client/

export BAL_CONFIG_FILES=bbe/service/Config.toml

sed -i 's+../resource/path/to+resources+g' bbe/service/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client/client.bal

echo -e "\n--- Testing BBE ---"
bal build bbe/service
bal run bbe/service/target/bin/service.jar &
sleep 10s
bal build bbe/client
response=$(bal run bbe/client/target/bin/client.jar 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
