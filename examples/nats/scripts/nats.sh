source scripts/assert.sh

docker-compose -f resources/docker-compose.yml up &
sleep 30s
bal run nats_subscriber_credentials_auth.bal &
sleep 20s
response=$(bal run nats_publisher_credentials_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Message published successfully."
