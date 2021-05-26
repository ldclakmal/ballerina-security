source ../../scripts/assert.sh

bal run grpc_service_jwt_auth.bal &
sleep 10s
response=$(bal run grpc_client_self_signed_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
