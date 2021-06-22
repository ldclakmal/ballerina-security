source scripts/assert.sh

export BAL_CONFIG_FILES=packages/basic-auth-file-store/Config.toml

echo -e "\n--- Starting Ballerina Basic Auth - File service ---"
bal run packages/basic-auth-file-store &
sleep 10s

echo -e "\n--- Testing Client ---"
echo -e "\nClient Test-1: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina Basic Auth - File client:"
response=$(curl -k -i https://localhost:8080/api/add)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\nClient Test-2: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina Basic Auth - File client:"
response=$(curl -k -i https://localhost:8080/api/view)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertOK "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Testing Listener ---"
echo -e "\nListener Test-1: Authn Failure:"
echo -e "\nInvoking Ballerina Basic Auth - File service:"
response=$(curl -k -i -u eve:secret https://localhost:9090/orders/view)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertUnauthorized "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\nListener Test-2: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina Basic Auth - File service:"
response=$(curl -k -i -u bob:bob@123 https://localhost:9090/orders/add)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\nListener Test-3: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina Basic Auth - File service:"
response=$(curl -k -i -u alice:alice@123 https://localhost:9090/orders/view)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertOK "$(echo "${response}" | head -1 | tr -d '\r')"

exit 0
