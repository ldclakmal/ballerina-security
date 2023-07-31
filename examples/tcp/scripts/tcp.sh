source scripts/assert.sh

bal run tcp_listener_tls.bal &
sleep 20s
response=$(bal run tcp_client_tls.bal 2>&1 | tail -n 1)
assertNotEmpty "$response"
assertEquals "$response" "Received message: Hello, World!"
