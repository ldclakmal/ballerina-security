echo -e "\nRequesting access token from token endpoint:"
response=$(curl -kv -u 3VTwFk7u1i366wzmvpJ_LZlfAV4a:TNOH0ZklJm8sqS9U3IMMAZVth78a \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
echo -e "\nToken endpoint response: $response"
token=$(jq -r '.access_token' <<< $response)
echo -e "\nJWT: $token"

if [ -z "$token" ]
then
  exit 1
fi

echo -e "\nInvoking Ballerina JWT service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/view)
echo -e "\nBallerina service response: $response"

if [ $(jq '.qty' <<< $response) > 0 ]
then
  exit 0
else
  exit 1
fi
