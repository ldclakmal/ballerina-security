source scripts/assert.sh

bal run http_service_jwt_auth.bal &
sleep 20s
response=$(bal run http_client_self_signed_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
