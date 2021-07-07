source ../../scripts/assert.sh

docker-compose -f resources/docker-compose.yml up &
sleep 30s
bal run sftp_listener_credentials_auth.bal &
sleep 10s
response=$(bal run sftp_client_credentials_auth.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "File: /upload/sample.txt"
