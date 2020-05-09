echo -e "\nStarting OpenLDAP Server:"
docker-compose -f ./scripts/auth.ldap/docker-compose.yml up &
sleep 30s
