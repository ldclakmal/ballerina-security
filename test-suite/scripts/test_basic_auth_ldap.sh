source scripts/validate.sh

echo -e "\nStarting OpenLDAP Server:"
docker-compose -f scripts/resources/docker-compose.yml up &
sleep 30s

echo -e "\nBuilding Ballerina Basic Auth service package:"
bal build packages/test.auth.basic/ldap

echo -e "\nStarting Ballerina LDAP service:"
bal run packages/test.auth.basic/ldap &
sleep 10s

echo -e "\nTest1: Authn Failure:"
echo -e "\nInvoking Ballerina LDAP Auth service:"
response=$(curl -k -i -u eve:secret https://localhost:9090/orders/view)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthnFailure $response

echo -e "\nTest2: Authn Success - Authz Failure:"
echo -e "\nInvoking Ballerina LDAP Auth service:"
response=$(curl -k -i -u alice:alice123 https://localhost:9090/orders/add)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertAuthzFailure $response

echo -e "\nTest3: Authn Success - Authz Success:"
echo -e "\nInvoking Ballerina LDAP Auth service:"
response=$(curl -k -i -u ldclakmal:ldclakmal123 https://localhost:9090/orders/add)
assertNotEmpty $response
echo -e "\nBallerina service response: $response"
assertSuccess $response

exit 0
