source scripts/validate.sh

echo -e "\nStarting Ballerina Basic Auth service:"
bal run packages/auth/file --b7a.config.file=packages/auth/file/users.toml &
sleep 10s

echo -e "\nTest1: Authn Failure:"
echo -e "\nInvoking Ballerina Basic Auth service:"
response=$(curl -k -i -u eve:secret https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthnFailure $response

echo -e "\nTest2: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina Basic Auth service:"
response=$(curl -k -i -u bob:bob123 https://localhost:9090/orders/add)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthzFailure $response

echo -e "\nTest3: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina Basic Auth service:"
response=$(curl -k -i -u alice:alice123 https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertSuccess $response

exit 0
