echo -e "\nStarting Ballerina Basic Auth service:"
bal run packages/auth --b7a.config.file=packages/auth/users.toml &
sleep 10s
