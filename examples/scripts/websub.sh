source ../scripts/validate.sh

bal run websub_hub_service_with_jwt_auth.bal &
sleep 10s
bal run websub_subscriber_service_with_jwt_auth.bal &
sleep 10s
response=$(bal run websub_publisher_client_with_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty $response
if [[ "$response" != "Publish update successful." ]]; then
  echo "Expected: 'Publish update successful.'"
  echo "Actual: '$response'"
  exit 1
fi
