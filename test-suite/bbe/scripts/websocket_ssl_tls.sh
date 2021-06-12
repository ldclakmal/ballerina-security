source scripts/assert.sh
source scripts/common.sh

mkdir ssl
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/websocket-service-ssl-tls/websocket_service_ssl_tls.bal -o ssl/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/websocket-client-ssl-tls/websocket_client_ssl_tls.bal -o ssl/client.bal

sed -i 's+../resource/path/to+resources+g' ssl/service.bal
sed -i 's+../resource/path/to+resources+g' ssl/client.bal

echo -e "\n--- Testing BBE ---"
bal run ssl/service.bal &
sleep 10s
response=$(bal run ssl/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
