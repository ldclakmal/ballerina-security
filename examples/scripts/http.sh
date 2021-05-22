source ../scripts/validate.sh

bal run http_service_with_jwt_auth.bal &
sleep 10s
response=$(bal run http_client_with_self_signed_jwt_auth.bal 2>&1 | tail -n 1)
assertNotEmpty $response
assertTextPayload $response
