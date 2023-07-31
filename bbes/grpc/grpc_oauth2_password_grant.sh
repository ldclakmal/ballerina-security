source assert.sh

mkdir bbe
mkdir bbe/service
mkdir bbe/client
touch bbe/service/Ballerina.toml
touch bbe/client/Ballerina.toml

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/grpc-service-oauth2/grpc_service_oauth2.bal -o bbe/service/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/grpc-service-simple/grpc_service_simple.proto -o bbe/service/grpc_simple.proto
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/grpc-client-oauth2-password-grant-type/grpc_client_oauth2_password_grant_type.bal -o bbe/client/client.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/grpc-service-simple/grpc_service_simple.proto -o bbe/client/grpc_simple.proto

bal grpc --input bbe/service/grpc_simple.proto --output bbe/service/
bal grpc --input bbe/client/grpc_simple.proto --output bbe/client/

sed -i 's+../resource/path/to+resources+g' bbe/service/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client/client.bal

echo -e "\n--- Starting Ballerina STS ---"
docker run --rm -p 9445:9445 --name ballerina-sts ldclakmal/ballerina-sts:latest &
sleep 30s

echo -e "\n--- Testing BBE ---"
bal build bbe/service
bal run bbe/service/target/bin/service.jar &
sleep 20s
bal build bbe/client
response=$(bal run bbe/client/target/bin/client.jar 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello WSO2"
