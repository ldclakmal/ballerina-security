source ../scripts/validate.sh

bal run graphql_service_with_jwt_auth.bal &
sleep 10s
response=$(bal run http_client_with_self_signed_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty $response
if [[ "$response" != "{\"data\":{\"bar\":\"Hello, World!\"}}" ]]; then
  echo "Expected: '{\"data\":{\"bar\":\"Hello, World!\"}}'"
  echo "Actual: '$response'"
  exit 1
fi
