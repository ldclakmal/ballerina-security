source scripts/assert.sh

docker-compose -f resources/docker-compose.yml up &
sleep 60s
bal run rabbitmq_consumer_credentials_auth.bal &
sleep 10s
response=$(bal run rabbitmq_producer_credentials_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Message published successfully."
