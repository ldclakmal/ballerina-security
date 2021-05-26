source scripts/assert.sh

mkdir ssl
mkdir ssl/tests
echo '[package]
org = "ldclakmal"
name = "ssl"
version = "1.0.0"' > ssl/Ballerina.toml
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/http-service-ssl-tls/http_service_ssl_tls.bal -o ssl/service.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/http-service-ssl-tls/tests/http_service_ssl_tls_test.bal -o ssl/tests/service_test.bal
sed -i 's+../resource/path/to+resources+g' ssl/service.bal
sed -i 's+../resource/path/to+resources+g' ssl/tests/service_test.bal
bal build ssl
sleep 10s

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/bbe-revamp/new-examples/http-client-ssl-tls/http_client_ssl_tls.bal -o ssl/client.bal
sed -i 's+../resource/path/to+resources+g' ssl/client.bal
rm ssl/Ballerina.toml
bal run ssl/service.bal &
sleep 10s
response=$(bal run ssl/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
