echo -e "\nStarting Ballerina Basic Auth service:"
ballerina run packages/auth --b7a.config.file=packages/auth/users.toml &
sleep 10s
