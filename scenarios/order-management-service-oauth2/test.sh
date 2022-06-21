source assert.sh

echo -e "\n--- Cloning Ballerina OAuth2 Module ---"
git clone https://github.com/ballerina-platform/module-ballerina-oauth2.git

echo -e "\n--- Starting WSO2IS STS ---"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 90s

echo -e "\n--- Starting API Gateway ---"
cd module-ballerina-oauth2/examples/order-management-service/api_gateway
bal run &
sleep 20s

echo -e "\n--- Starting App Backend ---"
cd ../app_backend
bal run &
sleep 20s

echo -e "\n--- Test - Scenario 1 - Web App ---"
response=$(curl -k "https://localhost:8080/order/web?orderId=100500")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
id=$(jq -r '.id' <<< $response)
assertNotEmpty $id
assertEquals "$id" "100500"

echo -e "\n--- Test - Scenario 2 - Mobile App ---"
export ID_TOKEN="eyJhbGciOiJSUzI1NiIsICJ0eXAiOiJKV1QiLCAia2lkIjoiTXpZeE1tRmtPR1l3TVdJMFpXTm1ORGN4TkdZd1ltTTRaVEEzTVdJMk5EQXpaR1F6TkdNMFpHIn0.eyJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo5NDQzL29hdXRoMi90b2tlbiIsICJzdWIiOiJhZG1pbiIsICJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo5NDQzL29hdXRoMi90b2tlbiIsICJleHAiOjE5NTg2MTIwMjksICJuYmYiOjE2NDMyNTIwMjksICJpYXQiOjE2NDMyNTIwMjl9.MBjE6L8xu3QyuN9bjJfcg-yCAbmuPrqidWRRp0Gcu120_wIis7nmg7xOr8BW-6h8CQEswjIXyW5ULYk_y9d61zPNJlPbcTgJSHc2roPuBGoa3szHjd1G2eZE14SLsLUsbmz5_g1ZeOrqJxtKAholUENvN1xZtSw8jZwc_RMRA3xXaLvfoys0I6D-iQqrqjQ2CmCoZTkqTPDkoV8xRS4U4AGJgXJtRqfQeEPjJsnTSQpidMuElEnUnV_u6MZhwhZVSNBbLZZpu8SPsyL-FHftd_VVGI6abrOFP4XZaRwVomyClme2q7zTH_H66Pkh_85J9_tj14cODY81J8Tbmloj7g"
response=$(curl -k "https://localhost:8080/order/mobile?orderId=100500&idToken=$ID_TOKEN")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
id=$(jq -r '.id' <<< $response)
assertNotEmpty $id
assertEquals "$id" "100500"
