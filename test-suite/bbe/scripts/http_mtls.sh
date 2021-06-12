source scripts/assert.sh
source scripts/common.sh

mkdir mtls
mkdir mtls/tests
echo '[package]
org = "ldclakmal"
name = "mtls"
version = "1.0.0"' > mtls/Ballerina.toml
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-service-mutual-ssl/http_service_mutual_ssl.bal -o mtls/service.bal
curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-service-mutual-ssl/tests/http_service_mutual_ssl_test.bal -o mtls/tests/service_test.bal
sed -i 's+../resource/path/to+resources+g' mtls/service.bal
sed -i 's+../resource/path/to+resources+g' mtls/tests/service_test.bal
bal build mtls
sleep 10s

curl https://raw.githubusercontent.com/${organization}/ballerina-distribution/${branch}/examples/http-client-mutual-ssl/http_client_mutual_ssl.bal -o mtls/client.bal
sed -i 's+../resource/path/to+resources+g' mtls/client.bal
rm mtls/Ballerina.toml
bal run mtls/service.bal &
sleep 10s
response=$(bal run mtls/client.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
