source assert.sh

mkdir bbe
mkdir bbe/service
mkdir bbe/client
touch bbe/service/Ballerina.toml
touch bbe/client/Ballerina.toml

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-service-oauth2/grpc_service_oauth2.bal -o bbe/service/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-service-oauth2/grpc_service.proto -o bbe/service/grpc_service.proto
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-client-oauth2-jwt-bearer-grant-type/grpc_client_oauth2_jwt_bearer_grant_type.bal -o bbe/client/client.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/$ACTIVE_BRANCH/examples/grpc-client-oauth2-jwt-bearer-grant-type/grpc_client.proto -o bbe/client/grpc_client.proto

bal grpc --input bbe/service/grpc_service.proto --output bbe/service/
bal grpc --input bbe/client/grpc_client.proto --output bbe/client/

sed -i 's+../resource/path/to+resources+g' bbe/service/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client/client.bal

echo -e "\n--- Starting Ballerina STS ---"
docker run --rm -p 9445:9445 --name ballerina-sts ldclakmal/ballerina-sts:latest &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal build bbe/service
bal run bbe/service/target/bin/service.jar &
sleep 10s
bal build bbe/client
response=$(bal run bbe/client/target/bin/client.jar 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
