source assert.sh

echo -e "\n--- Starting WSO2IS STS ---"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 90s

echo -e "\n--- Starting Ballerina JWT service ---"
bal run &
sleep 15s

echo -e "\n--- Testing Client ---"
for id in 1 2
do
  echo -e "\nClient Test-$id.1: Authn Success - Authz Failure:"
  echo -e "\nInvoking Ballerina JWT client:"
  response=$(curl -k -i https://localhost:8080/api/$id/add)
  assertNotEmpty "$response"
  echo -e "\nBallerina client response: $response"
  assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

  echo -e "\nClient Test-$id.2: Authn Success - Authz Success:"
  echo -e "\nInvoking Ballerina JWT client:"
  response=$(curl -k -i https://localhost:8080/api/$id/view)
  assertNotEmpty "$response"
  echo -e "\nBallerina client response: $response"
  assertOK "$(echo "${response}" | head -1 | tr -d '\r')"
done

echo -e "\n--- Testing Listener ---"
echo -e "\nRequesting access token from token endpoint:"
response=$(curl -kv -u I8_BIl8BxpVj1SzZm6Q49y4jFuIa:mcxB3K3hxZHn746K7vljJmmuKlEa \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
assertNotEmpty "$response"
echo -e "\nToken endpoint response: $response"
token=$(jq -r '.access_token' <<< $response)
assertNotEmpty $token
echo -e "\nJWT: $token"

for id in 1 2 3
do
  echo -e "\nListener Test-$id.1: Authn Failure:"
  echo -e "\nInvoking Ballerina JWT service:"
  response=$(curl -k -i -H "AUTHORIZATION: Bearer InvalidToken" https://localhost:9090/orders$id/view)
  assertNotEmpty "$response"
  echo -e "\nBallerina service response: $response"
  assertUnauthorized "$(echo "${response}" | head -1 | tr -d '\r')"

  echo -e "\nListener Test-$id.2: Authn Success - Authz Failure:"
  echo -e "\nInvoking Ballerina JWT service:"
  response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders$id/add)
  assertNotEmpty "$response"
  echo -e "\nBallerina service response: $response"
  assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

  echo -e "\nListener Test$id.3: Authn Success - Authz Success:"
  echo -e "\nInvoking Ballerina JWT service:"
  response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders$id/view)
  assertNotEmpty "$response"
  echo -e "\nBallerina service response: $response"
  assertOK "$(echo "${response}" | head -1 | tr -d '\r')"
done

exit 0
