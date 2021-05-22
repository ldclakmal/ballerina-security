source scripts/validate.sh

curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-service-with-jwt-auth/http_service_with_jwt_auth.bal > packages/bbe/access-control/jwt-auth/http_service_with_jwt_auth.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/master/examples/http-client-with-self-signed-jwt-auth/http_client_with_self_signed_jwt_auth.bal > packages/bbe/access-control/jwt-auth/http_client_with_self_signed_jwt_auth.bal

sed -i 's+../resource/path/to+packages/resources+g' packages/bbe/access-control/jwt-auth/http_service_with_jwt_auth.bal
sed -i 's+../resource/path/to+packages/resources+g' packages/bbe/access-control/jwt-auth/http_client_with_self_signed_jwt_auth.bal

echo -e "\n--- Testing BBE ---"
bal run packages/bbe/access-control/jwt-auth/http_service_with_jwt_auth.bal &
sleep 10s
response=$(bal run packages/bbe/access-control/jwt-auth/http_client_with_self_signed_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertStatusCode $response
