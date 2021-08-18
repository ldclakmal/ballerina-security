source assert.sh

docker-compose -f resources/docker-compose.yml up &
sleep 30s
bal run imap_email_listener_tls.bal &
sleep 10s
response=$(bal run smtp_email_client_tls.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Email sent successfully."
