source assert.sh

echo -e "\n--- Starting OpenLDAP Server ---"
docker-compose -f resources/docker-compose.yml up &
sleep 30s

echo -e "\n--- Starting Ballerina Basic Auth - LDAP service ---"
bal run &
sleep 15s

echo -e "\n--- Testing Client ---"
echo -e "\n--- Client Test-1: Authn Success - Authz Failure---"
response=$(curl -k -i https://localhost:8080/api/add)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Client Test-2: Authn Success - Authz Success---"
response=$(curl -k -i https://localhost:8080/api/view)
assertNotEmpty "$response"
echo -e "\nBallerina client response: $response"
assertOK "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Testing Listener ---"
echo -e "\n--- Listener Test-1: Authn Failure---"
response=$(curl -k -i -u eve:secret https://localhost:9090/orders/view)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertUnauthorized "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Listener Test-2: Authn Success - Authz Failure---"
response=$(curl -k -i -u alice:alice@123 https://localhost:9090/orders/add)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertForbidden "$(echo "${response}" | head -1 | tr -d '\r')"

echo -e "\n--- Listener Test-3: Authn Success - Authz Success ---"
response=$(curl -k -i -u ldclakmal:ldclakmal@123 https://localhost:9090/orders/add)
assertNotEmpty "$response"
echo -e "\nBallerina service response: $response"
assertOK "$(echo "${response}" | head -1 | tr -d '\r')"

exit 0
