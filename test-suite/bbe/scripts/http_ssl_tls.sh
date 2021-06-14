source scripts/assert.sh
source scripts/common.sh

mkdir ssl
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-service-ssl-tls/http_service_ssl_tls.bal -o ssl/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-client-ssl-tls/http_client_ssl_tls.bal -o ssl/client.bal

sed -i 's+../resource/path/to+resources+g' ssl/service.bal
sed -i 's+../resource/path/to+resources+g' ssl/client.bal

echo -e "\n--- Testing BBE ---"
rm ssl/Ballerina.toml
bal run ssl/service.bal &
sleep 10s
response=$(bal run ssl/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
