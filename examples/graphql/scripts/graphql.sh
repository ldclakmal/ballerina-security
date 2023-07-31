source scripts/assert.sh

bal run graphql_service_jwt_auth.bal &
sleep 30s
response=$(bal run http_client_self_signed_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "{\"data\":{\"bar\":\"Hello, World!\"}}"
