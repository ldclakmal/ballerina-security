source assert.sh

echo -e "\n--- Starting Ballerina STS ---"
bal run &
sleep 15s

echo -e "\n--- Get access token with client credentials grant type ---"
response=$(curl -kv -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa \
            -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
            -d "grant_type=client_credentials&scope=view-order" \
            https://localhost:9445/oauth2/token)
assertNotEmpty "$response"
echo -e "\nResponse: $response"
token=$(jq -r '.access_token' <<< $response)
assertNotEmpty $token
echo -e "\nAccess Token: $token"
sleep 5s

echo -e "\n--- Refresh access token with refresh token grant type ---"
response=$(curl -kv -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa \
            -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
            -d "grant_type=refresh_token&refresh_token=24f19603-8565-4b5f-a036-88a945e1f272&scope=view-order" \
            https://localhost:9445/oauth2/token)
assertNotEmpty "$response"
echo -e "\nResponse: $response"
token=$(jq -r '.access_token' <<< $response)
assertNotEmpty $token
echo -e "\nAccess Token: $token"
sleep 5s

echo -e "\n--- Introspect access token ---"
response=$(curl -kv -u admin:admin -H 'Content-Type: application/x-www-form-urlencoded' \
            -d 'token=56ede317-4511-44b4-8579-a08f094ee8c5' \
            https://localhost:9445/oauth2/introspect)
assertNotEmpty "$response"
echo -e "\nResponse: $response"
active=$(jq -r '.active' <<< $response)
assertNotEmpty $active
echo -e "\nActive: $active"
sleep 5s
