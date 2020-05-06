source scripts/common/validate.sh

echo -e "\nInvoking Ballerina Basic Auth service:"
response=$(curl -kv -u alice:password1 https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertSuccess $response
