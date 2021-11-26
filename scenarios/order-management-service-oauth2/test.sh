source assert.sh

echo -e "\n--- Cloning Ballerina OAuth2 Module ---"
git clone https://github.com/ballerina-platform/module-ballerina-oauth2.git

echo -e "\n--- Starting WSO2IS STS ---"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 90s

echo -e "\n--- Starting API Gateway ---"
cd module-ballerina-oauth2/examples/order-management-service/api_gateway
bal run &
sleep 15s

echo -e "\n--- Starting App Backend ---"
cd ../app_backend
bal run &
sleep 15s

echo -e "\n--- Test - Scenario 1 - Web App ---"
response=$(curl -k -v "https://localhost:8080/order/web?orderId=100500")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
id=$(jq -r '.id' <<< $response)
assertNotEmpty $id
assertEquals "$id" "100500"

echo -e "\n--- Test - Scenario 2 - Mobile App ---"
export ID_TOKEN="eyJhbGciOiJSUzI1NiIsICJ0eXAiOiJKV1QiLCAia2lkIjoiTXpZeE1tRmtPR1l3TVdJMFpXTm1ORGN4TkdZd1ltTTRaVEEzTVdJMk5EQXpaR1F6TkdNMFpHIn0.eyJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo5NDQzL29hdXRoMi90b2tlbiIsICJzdWIiOiJhZG1pbiIsICJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo5NDQzL29hdXRoMi90b2tlbiIsICJleHAiOjE5NDQ0NzI2MjksICJuYmYiOjE2MjkxMTI2MjksICJpYXQiOjE2MjkxMTI2Mjl9.Qbi5kElPZlyViUUuYW9Ik4nXSeTIroacEDs4BoI0rAGAOBXfyWLW4Yxm6hAlb4GXtkPZ4YMO8c0mUgdXgvPVFqFYJuINNPu6Y_nExahAVD0VxCYRE59lEjRv7t_gqn5OxSu_jTGcgcHH8_j-tvL_-AHaqgflr5UljbTPtnQyXtLaPNeu3r7FoWs-LrewMPIm1aw5qc2gI2iYwI1jfIdpNlEjU6r_Mg6ou2D2AGqJa0QYN1FMqi4YJt2jHr60tQMQIWJ7zhKU4ShZESxYOVKK_cBOeL6K-A07pNEZYaSxtCU3609MIZ8EOUJuQUJb7zHHxG4QziHM8eBwFo26yovBFw"
response=$(curl -k -v "https://localhost:8080/order/mobile?orderId=100500&idToken=$ID_TOKEN")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
id=$(jq -r '.id' <<< $response)
assertNotEmpty $id
assertEquals "$id" "100500"
