source scripts/assert.sh

echo -e "\n--- Starting WSO2IS STS ---"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 90s

echo -e "\n--- Starting Ballerina OAuth2 service ---"
bal run packages/integration/oauth2 &
sleep 10s

echo -e "\n--- Testing Client ---"
echo -e "\nClient Test-1: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina OAuth2 client:"
response=$(curl -k -i https://localhost:8080/api/add)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertForbidden "$response"

echo -e "\nClient Test-2: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina OAuth2 client:"
response=$(curl -k -i https://localhost:8080/api/view)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertOK "$response"

echo -e "\n--- Testing Listener ---"
echo -e "\nRequesting access token from token endpoint:"
response=$(curl -kv -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
assertNotEmpty "$response"
echo -e "\nToken endpoint response: $response"
token=$(jq -r '.access_token' <<< $response)
assertNotEmpty $token
echo -e "\nOAuth2 token: $token"

echo -e "\nListener Test-1: Authn Failure:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -k -i -H "AUTHORIZATION: Bearer InvalidToken" https://localhost:9090/orders/view)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertUnauthorized "$response"

echo -e "\nListener Test-2: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/add)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertForbidden "$response"

echo -e "\nListener Test-3: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/view)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertOK "$response"

exit 0
