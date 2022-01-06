source assert.sh

echo -e "\n--- Starting WSO2IS STS ---"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 90s

echo -e "\n--- Starting Ballerina OAuth2 service ---"
bal run &
sleep 15s

echo -e "\n--- Testing Client ---"
echo -e "\n--- Client Test-1: Authn Success - Authz Failure ---"
response=$(curl -k -i https://localhost:8080/api/add)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Client Test-2: Authn Success - Authz Success ---"
response=$(curl -k -i https://localhost:8080/api/view)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertOK "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Testing Listener ---"
echo -e "\nRequesting access token from token endpoint..."
response=$(curl -k -u uDMwA4hKR9H3deeXxvNf4sSU0i4a:8FOUOKUQfOp47pUfJCsPA5X4clga \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
assertNotEmpty "$response"
echo -e "\nToken endpoint response: $response"
token=$(jq -r '.access_token' <<< $response)
assertNotEmpty $token
echo -e "\nOAuth2 token: $token"

echo -e "\n--- Listener Test-1: Authn Failure ---"
response=$(curl -k -i -H "AUTHORIZATION: Bearer InvalidToken" https://localhost:9090/orders/view)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertUnauthorized "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Listener Test-2: Authn Success - Authz Failure ---"
response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/add)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Listener Test-3: Authn Success - Authz Success ---"
response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/view)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertOK "$(echo "${response}" | head -1 | tr -d '\r')"

exit 0
