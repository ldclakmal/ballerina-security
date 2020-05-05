echo -e "\nRequesting access token from token endpoint:"
response=$(curl -kv -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
echo -e "\nToken endpoint response: $response"
token=$(jq '.access_token' <<< $response)
echo -e "\nAccess token: $token"

if [ -z "$token" ]
then
  echo "Failed!"
  exit 1
fi

echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/view)
echo -e "\nBallerina service response: $response"

if [ $(jq '.qty' <<< $response) > 0 ]
then
  echo "Success!"
  exit 0
else
  echo "Failed!"
  exit 1
fi
