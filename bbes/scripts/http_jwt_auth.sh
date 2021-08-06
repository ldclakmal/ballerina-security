source scripts/assert.sh
source scripts/common.sh

mkdir bbe
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-service-jwt-auth/http_service_jwt_auth.bal -o bbe/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-client-self-signed-jwt-auth/http_client_self_signed_jwt_auth.bal -o bbe/client.bal

sed -i 's+../resource/path/to+resources+g' bbe/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client.bal

echo -e "\n--- Testing BBE ---"
bal run bbe/service.bal &
sleep 10s
response=$(bal run bbe/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
