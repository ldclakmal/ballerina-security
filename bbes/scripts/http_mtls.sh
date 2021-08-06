source scripts/assert.sh
source scripts/common.sh

mkdir bbe
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-service-mutual-ssl/http_service_mutual_ssl.bal -o bbe/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-client-mutual-ssl/http_client_mutual_ssl.bal -o bbe/client.bal

sed -i 's+../resource/path/to+resources+g' bbe/service.bal
sed -i 's+../resource/path/to+resources+g' bbe/client.bal

echo -e "\n--- Testing BBE ---"
bal run bbe/service.bal &
sleep 10s
response=$(bal run bbe/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
