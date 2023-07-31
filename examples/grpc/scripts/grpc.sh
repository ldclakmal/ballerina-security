source scripts/assert.sh

touch service/Ballerina.toml
touch client/Ballerina.toml
bal grpc --input resources/grpc.proto --output service/
bal grpc --input resources/grpc.proto --output client/

bal build service
bal run service/target/bin/service.jar &
sleep 20s
bal build client
response=$(bal run client/target/bin/client.jar 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
