source ../scripts/assert.sh

bal run websocket_service_with_jwt_auth.bal &
sleep 10s
response=$(bal run websocket_client_with_self_signed_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Hello, World!"
