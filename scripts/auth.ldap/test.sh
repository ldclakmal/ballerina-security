source scripts/common/validate.sh

echo -e "\nInvoking Ballerina LDAP Auth service:"
response=$(curl -kv -u johndoe:johndoe123 https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertSuccess $response
