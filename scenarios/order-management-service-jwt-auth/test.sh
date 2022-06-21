source assert.sh

echo -e "\n--- Cloning Ballerina JWT Module ---"
git clone https://github.com/ballerina-platform/module-ballerina-jwt.git

echo -e "\n--- Starting STS ---"
cd module-ballerina-jwt/examples/order-management-service/sts
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

echo -e "\n--- Test - Create Order (without authentication) ---"
response=$(curl -k -i -H "Content-Type: application/json" \
           -d '{"id": "100500", "name": "Sample order", "items": [{"category": "electronics", "code": "SOWH1000XM4", "qty": 2}, {"category": "books", "code": "978-1617295959", "qty": 1}]}' \
           "https://localhost:9090/order")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertUnauthorized "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Test - Create Order (authenticating as the 'counter' user, who has 'add_order' permission) ---"
response=$(curl -k -H "Content-Type: application/json" \
          -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsICJ0eXAiOiJKV1QiLCAia2lkIjoiTlRBeFptTXhORE15WkRnM01UVTFaR00wTXpFek9ESmhaV0k0TkRObFpEVTFPR0ZrTmpGaU1RIn0.eyJpc3MiOiJ3c28yIiwgInN1YiI6ImNvdW50ZXIiLCAiYXVkIjoiYmFsbGVyaW5hIiwgImV4cCI6MTk0NTIzODg5NCwgIm5iZiI6MTYyOTg3ODg5NCwgImlhdCI6MTYyOTg3ODg5NCwgImp0aSI6ImY1YWRlZDUwNTg1YzQ2ZjJiOGNhMjMzZDBjMmEzYzlkIiwgInNjb3BlIjoiYWRkX29yZGVyIn0.FMDL-Y8zMtAW7vBVeEbwf_8ynSKdjAkuEBVJpoGds06Z2cOrL3WPZYswnbUOzULBnOXQJQEnK-P-QmypvqP0NWGpzfoC5QMqg0FhPvxyglP1QNYbrS_5tZFM_7Nn7tBFZxiBq666AzjDyhZ2jc39X9rftV0m8p4yyFdSI4KFiEzQ8eOWVVOIg3ejQ0ruDlSVvwx3lXe03XYmrhQp0m-_KYm-SGV3HTZttbo00A250pVY1QL137WDgeeDtGchOfjvM9G-UL8t3sw1Lyoq4OzblHEJJQOJnfRLM_nFKeULuAtt5k_UwmQRlV-XrgxMk0lu6KvYt1-Sa1HMiS8aIvrwig" \
          -d '{"id": "100500", "name": "Sample order", "items": [{"category": "electronics", "code": "SOWH1000XM4", "qty": 2}, {"category": "books", "code": "978-1617295959", "qty": 1}]}' \
          "https://localhost:9090/order")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertEquals "$response" "{\"status\":\"Order '100500' created.\"}"

echo -e "\n--- Test - Retrieve Order ---"
response=$(curl -k "https://localhost:9090/order/100500")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
id=$(jq -r '.id' <<< $response)
assertNotEmpty $id
assertEquals "$id" "100500"

echo -e "\n--- Test - Update Order (without authentication) ---"
response=$(curl -k -i -X PUT -H "Content-Type:application/json" \
          -d '{"name": "Updated order", "items": [{"category": "electronics", "code": "SOWH1000XM4", "qty": 1}]}' \
          "https://localhost:9090/order/100500")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertUnauthorized "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Test - Update Order (authenticating as 'counter' user, who has 'add_order' permission) ---"
response=$(curl -k -i -X PUT -H "Content-Type:application/json" \
          -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsICJ0eXAiOiJKV1QiLCAia2lkIjoiTlRBeFptTXhORE15WkRnM01UVTFaR00wTXpFek9ESmhaV0k0TkRObFpEVTFPR0ZrTmpGaU1RIn0.eyJpc3MiOiJ3c28yIiwgInN1YiI6ImNvdW50ZXIiLCAiYXVkIjoiYmFsbGVyaW5hIiwgImV4cCI6MTk0NTIzODg5NCwgIm5iZiI6MTYyOTg3ODg5NCwgImlhdCI6MTYyOTg3ODg5NCwgImp0aSI6ImY1YWRlZDUwNTg1YzQ2ZjJiOGNhMjMzZDBjMmEzYzlkIiwgInNjb3BlIjoiYWRkX29yZGVyIn0.FMDL-Y8zMtAW7vBVeEbwf_8ynSKdjAkuEBVJpoGds06Z2cOrL3WPZYswnbUOzULBnOXQJQEnK-P-QmypvqP0NWGpzfoC5QMqg0FhPvxyglP1QNYbrS_5tZFM_7Nn7tBFZxiBq666AzjDyhZ2jc39X9rftV0m8p4yyFdSI4KFiEzQ8eOWVVOIg3ejQ0ruDlSVvwx3lXe03XYmrhQp0m-_KYm-SGV3HTZttbo00A250pVY1QL137WDgeeDtGchOfjvM9G-UL8t3sw1Lyoq4OzblHEJJQOJnfRLM_nFKeULuAtt5k_UwmQRlV-XrgxMk0lu6KvYt1-Sa1HMiS8aIvrwig" \
          -d '{"name": "Updated order", "items": [{"category": "electronics", "code": "SOWH1000XM4", "qty": 1}]}' \
          "https://localhost:9090/order/100500")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Test - Update Order (authenticating as 'admin' user, who has 'add_order, update_order, cancel_order' permissions) ---"
response=$(curl -k -X PUT -H "Content-Type:application/json" \
          -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsICJ0eXAiOiJKV1QiLCAia2lkIjoiTlRBeFptTXhORE15WkRnM01UVTFaR00wTXpFek9ESmhaV0k0TkRObFpEVTFPR0ZrTmpGaU1RIn0.eyJpc3MiOiJ3c28yIiwgInN1YiI6ImFkbWluIiwgImF1ZCI6ImJhbGxlcmluYSIsICJleHAiOjE5NDUyMzY1OTksICJuYmYiOjE2Mjk4NzY1OTksICJpYXQiOjE2Mjk4NzY1OTksICJqdGkiOiJkMWI4NjNlNjc1N2M0ZjJlYjViMjM3YjI5ZmRhOGZhZSIsICJzY29wZSI6WyJhZGRfb3JkZXIiLCAidXBkYXRlX29yZGVyIiwgImNhbmNlbF9vcmRlciJdfQ.XxThNFztJTpn9FIk-9JfEm_xF8sbTwGnNa5bOl-l4lb3KfeV5ojAKEmjenpQR_2YctT2GM68mxunXP4CTxXoAVHAYWDmV10wkR4r7R6LO3wDJDqr7POC3zwtM-n9Ro-gWJEio-SLYw04kxExvjsE1aFa7pRJFuAFDIdAqnXkEaHLXshmOCgxYhAMzdgBQzUtBo7QmjQZf_0kPUioPpNNsDV4bGLQTeZo-SCZhfhvbHBrUsY2VVleUg0_gNVMmT0ySFQ8Jci4CaiglYrxQN9byS38_9qXtWINYEMbtApHaeyl4-0YvY5p8EbJes2ep_r0Q_Od6FQzGekFAVO4gSE6Zw" \
          -d '{"name": "Updated order", "items": [{"category": "electronics", "code": "SOWH1000XM4", "qty": 1}]}' \
          "https://localhost:9090/order/100500")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertEquals "$response" "{\"status\":\"Order '100500' updated.\"}"

echo -e "\n--- Test - Cancel Order (authenticating as 'admin' user, who has 'add_order, update_order, cancel_order' permissions) ---"
response=$(curl -k -X DELETE \
          -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsICJ0eXAiOiJKV1QiLCAia2lkIjoiTlRBeFptTXhORE15WkRnM01UVTFaR00wTXpFek9ESmhaV0k0TkRObFpEVTFPR0ZrTmpGaU1RIn0.eyJpc3MiOiJ3c28yIiwgInN1YiI6ImFkbWluIiwgImF1ZCI6ImJhbGxlcmluYSIsICJleHAiOjE5NDUyMzY1OTksICJuYmYiOjE2Mjk4NzY1OTksICJpYXQiOjE2Mjk4NzY1OTksICJqdGkiOiJkMWI4NjNlNjc1N2M0ZjJlYjViMjM3YjI5ZmRhOGZhZSIsICJzY29wZSI6WyJhZGRfb3JkZXIiLCAidXBkYXRlX29yZGVyIiwgImNhbmNlbF9vcmRlciJdfQ.XxThNFztJTpn9FIk-9JfEm_xF8sbTwGnNa5bOl-l4lb3KfeV5ojAKEmjenpQR_2YctT2GM68mxunXP4CTxXoAVHAYWDmV10wkR4r7R6LO3wDJDqr7POC3zwtM-n9Ro-gWJEio-SLYw04kxExvjsE1aFa7pRJFuAFDIdAqnXkEaHLXshmOCgxYhAMzdgBQzUtBo7QmjQZf_0kPUioPpNNsDV4bGLQTeZo-SCZhfhvbHBrUsY2VVleUg0_gNVMmT0ySFQ8Jci4CaiglYrxQN9byS38_9qXtWINYEMbtApHaeyl4-0YvY5p8EbJes2ep_r0Q_Od6FQzGekFAVO4gSE6Zw" \
          "https://localhost:9090/order/100500")
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertEquals "$response" "{\"status\":\"Order '100500' removed.\"}"
