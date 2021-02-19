source scripts/validate.sh

echo -e "\nStarting WSO2IS STS:"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 90s

echo -e "\nStarting Ballerina JWT service:"
bal run packages/test.auth.jwt &
sleep 10s

echo -e "\nRequesting access token from token endpoint:"
response=$(curl -kv -u 3VTwFk7u1i366wzmvpJ_LZlfAV4a:TNOH0ZklJm8sqS9U3IMMAZVth78a \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
assertNotEmpty $response
echo -e "\nToken endpoint response: $response"
token=$(jq -r '.access_token' <<< $response)
assertNotEmpty $token
echo -e "\nJWT: $token"

for port in 9090 9091
do
  echo -e "\nTest1: Authn Failure:"
  echo -e "\nInvoking Ballerina JWT service:"
  response=$(curl -k -i -H "AUTHORIZATION: Bearer InvalidToken" https://localhost:$port/orders/view)
  assertNotEmpty $response
  echo -e "\nBallerina service response: $response"
  assertAuthnFailure $response

  echo -e "\nTest2: Authn Success - Authz Failure:"
  echo -e "\nInvoking Ballerina JWT service:"
  response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:$port/orders/add)
  assertNotEmpty $response
  echo -e "\nBallerina service response: $response"
  assertAuthzFailure $response

  echo -e "\nTest3: Authn Success - Authz Success:"
  echo -e "\nInvoking Ballerina JWT service:"
  response=$(curl -k -i -H "AUTHORIZATION: Bearer $token" https://localhost:$port/orders/view)
  assertNotEmpty $response
  echo -e "\nBallerina service response: $response"
  assertSuccess $response
done

exit 0
