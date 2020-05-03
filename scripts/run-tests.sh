echo -e "\nStarting Ballerina OAuth2 service:"
ballerina run src/oauth2/oauth2_secured_service.bal &
sleep 5s

echo -e "\nStarting WSO2IS STS:"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 120s

echo -e "\nRequesting access token from token endpoint:"
response=$(curl -kv -u gCuMDk_qfue0XUpEDUJZHmH4bZMa:wn3SwVn5xH_PuIf8myf6KJxRN3Aa \
          -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
          -d "grant_type=client_credentials&scope=view-order" \
          https://localhost:9443/oauth2/token)
echo -e "\nToken endpoint response:"
echo $response
token=$(jq '.access_token' <<< $response)
echo -e "\nAccess token: " $token

echo -e "\nInvoking Ballerina OAuth2 service:"
response=$(curl -kv -H "AUTHORIZATION: Bearer $token" https://localhost:9090/orders/view)
echo -e "\nBallerina service response:"
echo $response

if [$(jq '.qty' <<< $response) > 0]
then
  exit 0  # Success
else
  exit 1  # Failed
fi
