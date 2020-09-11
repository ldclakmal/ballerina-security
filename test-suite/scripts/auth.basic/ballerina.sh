echo -e "\nStarting Ballerina Basic Auth service:"
ballerina run src/auth.basic/basic_auth_secured_service.bal --b7a.config.file=src/auth.basic/users.toml &
sleep 5s
