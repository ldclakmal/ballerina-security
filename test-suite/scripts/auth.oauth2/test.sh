source ../scripts/common/validate.sh

echo -e "\nRequesting access token from token endpoint:"
response=$(curl -kv -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
assertNotEmpty $response
echo -e "\nToken endpoint response: $response"
token=$(jq -r '.access_token' <<< $response)
assertNotEmpty $token
echo -e "\nOAuth2 token: $token"

echo -e "\nTest1: Authn Failure:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer InvalidToken" https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthnFailure $response

echo -e "\nTest2: Authn Failure [Cached]:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer InvalidToken" https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthnFailure $response

echo -e "\nTest3: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/add)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthzFailure $response

echo -e "\nTest4: Authn Success - Authz Failure [Cached]:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/add)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthzFailure $response

echo -e "\nTest5: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertSuccess $response

echo -e "\nTest6: Authn Success - Authz Success [Cached]:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertSuccess $response

exit 0
