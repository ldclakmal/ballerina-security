source ../../scripts/assert.sh

docker-compose -f resources/docker-compose.yml up &
sleep 30s
bal run nats_subscriber_basic_auth.bal &
sleep 10s
response=$(bal run nats_publisher_basic_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Message published successfully."
