source scripts/assert.sh

bal run websub_hub_service_jwt_auth.bal &
sleep 20s
bal run websub_subscriber_service_jwt_auth.bal &
sleep 20s
response=$(bal run websub_publisher_client_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Publish update successful."
