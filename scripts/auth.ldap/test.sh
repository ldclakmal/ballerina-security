source scripts/common/validate.sh

echo -e "\nTest1: Authn Failure:"
echo -e "\nInvoking Ballerina LDAP Auth service:"
response=$(curl -kv -u eve:secret https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthnFailure $response

echo -e "\nTest2: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina LDAP Auth service:"
response=$(curl -kv -u janedoe:janedoe123 https://localhost:9090/orders/add)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthzFailure $response

echo -e "\nTest3: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina LDAP Auth service:"
response=$(curl -kv -u janedoe:janedoe123 https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertSuccess $response
