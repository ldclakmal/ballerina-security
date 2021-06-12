source scripts/assert.sh

mkdir ssl
mkdir ssl/tests
echo '[package]
org = "ldclakmal"
name = "ssl"
version = "1.0.0"' > ssl/Ballerina.toml
curl https://raw.githubusercontent.com/${1}/ballerina-distribution/${2}/examples/websocket-service-ssl-tls/websocket_service_ssl_tls.bal -o ssl/service.bal
curl https://raw.githubusercontent.com/${1}/ballerina-distribution/${2}/examples/websocket-client-ssl-tls/websocket_client_ssl_tls.bal -o ssl/client.bal

sed -i 's+../resource/path/to+resources+g' ssl/service.bal
sed -i 's+../resource/path/to+resources+g' ssl/client.bal
bal run ssl/service.bal &
sleep 10s
response=$(bal run ssl/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
