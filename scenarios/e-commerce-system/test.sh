source assert.sh

echo -e "\n--- Starting WSO2IS STS ---"
docker run -p 9443:9443 ldclakmal/wso2is-sts:latest &
sleep 90s

echo -e "\n--- Starting Payment Service ---"
cd payment_service
bal run &
sleep 20s

echo -e "\n--- Starting Delivery Service ---"
cd ../delivery_service
bal run &
sleep 20s

echo -e "\n--- Starting Inventory Service ---"
cd ../inventory_service
bal run &
sleep 20s

echo -e "\n--- Starting Order Service ---"
cd ../order_service
bal run &
sleep 20s

echo -e "\n--- Starting API Gateway ---"
cd ../api_gateway
bal run &
sleep 20s

echo -e "\n--- Starting Client ---"
cd ../client
response=$(bal run 2>&1 | tail -n 1)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
search_response=$(jq -r '.search_response.data.electronics[0].brand' <<< $response)
assertNotEmpty $search_response
assertEquals "$search_response" "Apple"

order_response=$(jq -r '.order_response.payment.order_id' <<< $response)
assertNotEmpty $order_response
assertEquals "$order_response" "HQCKJ5496"
