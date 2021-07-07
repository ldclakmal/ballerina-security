source ../../scripts/assert.sh

docker-compose -f resources/docker-compose.yml up &
sleep 60s
bal run kafka_consumer_sasl_plain_auth.bal &
sleep 10s
response=$(bal run kafka_producer_sasl_plain_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Message published successfully."
