source scripts/assert.sh
source scripts/common.sh

mkdir mtls
mkdir mtls/tests
echo '[package]
org = "ldclakmal"
name = "mtls"
version = "1.0.0"' > mtls/Ballerina.toml
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/websocket-service-mutual-ssl/websocket_service_mutual_ssl.bal -o mtls/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/websocket-client-mutual-ssl/websocket_client_mutual_ssl.bal -o mtls/client.bal

sed -i 's+../resource/path/to+resources+g' mtls/service.bal
sed -i 's+../resource/path/to+resources+g' mtls/client.bal

echo -e "\n--- Testing BBE ---"
bal run mtls/service.bal &
sleep 10s
response=$(bal run mtls/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
